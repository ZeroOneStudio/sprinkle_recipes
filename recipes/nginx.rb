package :nginx_source, :provides => :webserver do
  requires :essentials, :nginx_dependencies
  description 'Nginx Web Server'
  version '1.7.10'

  initscript = File.join(File.dirname(__FILE__), '..', 'nginx', 'nginx')
  transfer initscript, "/etc/init.d/nginx", :sudo => true

  noop do
    post :install, "sudo chmod +x /etc/init.d/nginx"
    post :install, "sudo /usr/sbin/update-rc.d -f nginx defaults"
  end

  source "http://nginx.org/download/nginx-#{version}.tar.gz" do
    post :install, '/etc/init.d/nginx start'
  end

  verify do
    has_executable '/etc/init.d/nginx'
    has_process 'nginx'
    matches_local initscript, "/etc/init.d/nginx"
  end
end

package :nginx_dependencies do
  description 'Nginx Web Server Build Dependencies'
  apt %w( libc6 libpcre3 libpcre3-dev libpcrecpp0 libssl0.9.8 libssl-dev zlib1g zlib1g-dev lsb-base )
end
