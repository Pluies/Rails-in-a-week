# RVM bootstrap
ENV['rvm_path']||="/usr/local/rvm"
$:.unshift(File.expand_path("/usr/local/rvm/lib"))
require 'rvm/capistrano'
set :rvm_ruby_string, '1.9.2'
set :rvm_type, :system

set :application, "antipodes"
set :repository,  "git+ssh://root@vps10371.ovh.net/home/florent/rails.git/"

require 'bundler/capistrano'
set :bundle_gemfile,      "Gemfile"
set :bundle_dir,          fetch(:shared_path)+"/bundle"
set :bundle_flags,       "--deployment" # --quiet"
set :bundle_without,      [:development, :test]

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

set :deploy_to, "/var/www/"

set :user,"root"
set :scm_username, "root"

server "vps10371.ovh.net", :web, :app, :db, :primary => true

set :use_sudo, false

#before 'deploy:finalize_update', 'x:set_current_release'
#task :set_current_release, :roles => :app do
#    set :current_release, latest_release
#end

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end
