require 'capistrano/ext/multistage'
require 'bundler/capistrano'

ssh_options[:forward_agent] = true
default_run_options[:pty]   = true


set :stages, %w(minecraft)
set :default_stage, "minecraft"
set :application, "miner"
set :repository,  "http://github.com/mafolz/miner"
set :scm, :git

#role :web, "your web-server here"                          # Your HTTP server, Apache/etc
#role :app, "your app-server here"                          # This may be the same as your `Web` server
#role :db,  "your primary db-server here", :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

namespace :deploy do
  desc "copy all example configurations to shared dir"
  task :init_config do
    run "cp #{current_path}/config/application.yml.example #{shared_path}/config/application.yml"
  end
end

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end
