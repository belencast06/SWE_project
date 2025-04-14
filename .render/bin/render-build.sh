#!/usr/bin/env bash
# exit on error
set -o errexit

# Install dependencies
bundle install

# Precompile assets
bundle exec rake assets:precompile

# Run database migrations
bundle exec rake db:migrate