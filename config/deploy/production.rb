server '99.79.123.96', user: 'ubuntu', roles: %w[app db web] # server "db.example.com", user: "deploy", roles: %w{db}
app = ENV['APP']
app = 'WilliamSinclair' if app.nil? or app.empty?
set :application, app
set :rails_env, 'development'
set :bundle_without, 'production'
set :deploy_to, "/home/ubuntu/apps/#{app}"
set :linked_dirs, %w[tmp/pids tmp/sockets log]
set :linked_files,
    %w[config/database.yml config/dwh_db.yml config/application.yml]


# role-based syntax
# ==================

# Defines a role with one or multiple servers. The primary server in each
# group is considered to be the first unless any hosts have the primary
# property set. Specify the username and a domain or IP for the server.
# Don't use `:all`, it's a meta role.

role :app, %w[ubuntu@99.79.123.96]
role :web, %w[ubuntu@99.79.123.96]
role :db, %w[ubuntu@99.79.123.96]
