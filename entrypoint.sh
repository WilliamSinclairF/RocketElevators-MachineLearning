#!/usr/bin/env bash

# Precompile assets
bundle exec rake assets:precompile
bin/rails db:migrate RAILS_ENV=development
bin/rails db:seed
bin/rails dwh:db:migrate RAILS_ENV=development
bin/rails dwh:sync

# Remove a potentially pre-existing server.pid for Rails.
rm -f tmp/pids/server.pid

# Run the Rails server
bundle exec rails server -b 0.0.0.0 -p 8080