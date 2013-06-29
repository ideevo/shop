require "bundler/capistrano"

set :user, 'fs'
set :group, 'fs'

set :deploy_to, "/home/fs/apps/future/ideevo.com"
set :current_dir, "current"

set :application, "ideevo"
set :scm,        :git
set :repository,  "git://github.com/ideevo/shop.git"
set :branch,     "master"

set :rake, "bundle exec rake"
set :use_sudo,    false
set :ssh_options, { :forward_agent => true, :port => (ENV['SSH_PORT'] || raise('Set SSH_PORT')) }

set(:latest_release)    { fetch(:current_path) }
set(:release_path)      { fetch(:current_path) }
set(:current_release)   { fetch(:current_path) }
set(:current_revision)  { capture("cd #{current_path}; git rev-parse --short HEAD").strip }
set(:latest_revision)   { capture("cd #{current_path}; git rev-parse --short HEAD").strip }
set(:previous_revision) { capture("cd #{current_path}; git rev-parse --short HEAD@{1}").strip }

set :rails_env, "production"
default_environment["RAILS_ENV"] = fetch(:rails_env)

server "fs", :app, :web, :db, :primary => true

namespace :deploy do
  # Overwritten to prevent symlink
  desc "Update the code."
  task :update do
    transaction do
      update_code
      finalize_update
    end
  end

  # Overwritten. We simply update the git repo.
  task :update_code do
    run "cd #{current_path} && git reset --hard && git fetch origin && git checkout #{branch} && git pull origin #{branch}"
  end

  task :finalize_update do
    run <<-CMD
      cd #{latest_release} &&
      bundle exec rake assets:precompile
    CMD
  end
end

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

namespace :rollback do
  task :code do
    puts 'Never turning back.'
  end

  task :repo do
    puts 'Never turning back.'
  end

  task :cleanup do
    puts 'Never turning back.'
  end

  task :default do
    puts 'Never turning back.'
  end
end
