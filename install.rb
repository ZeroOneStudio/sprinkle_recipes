# Require our stack
%w(htop essentials ruby git rails databases redis nginx imagemagick).each do |r|
  require File.join(File.dirname(__FILE__), 'recipes', r)
end

policy :stack, :roles => :app do
  requires :ruby                  # RUBY
  requires :htop                  # htop
  # requires :webserver             # Nginx
  requires :database              # MySQL or Postgres with appropriate ruby gems
  requires :git                   # Git or Mercurial
  # requires :rails                 # Latest stable version of Ruby on Rails
  requires :redis                 # Redis database, recipe is not stable and not recomended to use at this time
  requires :imagemagick           # ImageMagick utility
end

deployment do
  # mechanism for deployment
  delivery :capistrano do
    begin
      recipes 'Capfile'
    rescue LoadError
      recipes 'deploy'
    end
  end
  # source based package installer defaults
  source do
    prefix   '/opt'
    archives '/usr/local/sources'
    builds   '/usr/local/build'
  end
end

# Depend on a specific version of sprinkle
begin
  gem 'sprinkle', ">= 0.2.1"
rescue Gem::LoadError
  puts "sprinkle 0.2.1 required.\n Run: `sudo gem install sprinkle`"
  exit
end
