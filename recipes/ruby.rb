package :ruby do
  requires :ruby_dependencies
  description 'Ruby Virtual Machine'

  version '2.2.0'

  source "ftp://ftp.ruby-lang.org/pub/ruby/1.9/ruby-#{version}.tar.gz"

  # patchlevel '290'
  # source "ftp://ftp.ruby-lang.org/pub/ruby/1.9/ruby-#{version}-p#{patchlevel}.tar.gz"

  verify { has_executable_with_version "/usr/local/bin/ruby", version }
end

package :ruby_dependencies do
  description 'Ruby Virtual Machine Build Dependencies'
  apt %w( bison zlib1g-dev libssl-dev libreadline5-dev libncurses5-dev libyaml-0-2 file )
end
