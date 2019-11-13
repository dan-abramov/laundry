# config valid for current version and patch releases of Capistrano
lock "~> 3.8.0"

set :application, "laundry"
set :repo_url, "git@bitbucket.org:x1ting/laundry.git"

# basic settings
set :deploy_to, -> { "/var/www/#{fetch(:application)}" }
set :keep_releases, 3

# logging
set :log_level, :info

# linked files
set :linked_files, fetch(:linked_files, []) + %w(config/database.yml config/secrets.yml)

# linked dirs
set :linked_dirs, fetch(:linked_dirs, []) + %w(log
                                               tmp/pids
                                               tmp/cache
                                               tmp/sockets
                                               vendor/bundle
                                               public/uploads
                                               public/wiki)

# capistrano-rbenv settings
set :rbenv_type, :user
set :rbenv_ruby, '2.4.2'

# capistrano3-puma settings
set :puma_bind, -> { %W(unix://#{shared_path}/tmp/sockets/application.sock) }
set :puma_worker_timeout, 30
set :puma_init_active_record, false


ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp
