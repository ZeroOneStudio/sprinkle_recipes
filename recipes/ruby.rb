package :ruby do
  description 'Ruby Virtual Machine'
  version '2.2.2'
  source "http://ftp.ruby-lang.org/pub/ruby/2.2/ruby-#{version}.tar.gz"
  requires :ruby_dependencies
  verify do
    has_executable '/opt/bin/ruby'
  end
end

package :ruby_dependencies do
  description 'Ruby Virtual Machine Build Dependencies'
  apt %w( curl file bison zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev )
end
