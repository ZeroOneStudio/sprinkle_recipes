# Fill host_address in
set :host_address, "194.177.20.103"

role :app, host_address
role :web, host_address
role :db,  host_address, :primary => true

# Fill user in - if remote user is different to your local user
set :user, "deploy"
set :password, ""
set :use_sudo, true
set :run_method, :sudo

# Fill options below if you wish to use public/private-key auth instead of password one
#
default_run_options[:pty] = true
