# Cancannible Demo with Rails 3.2

Note: this is work-in-progress..

## How to run the application locally

    # clone the app and bundle (NB: assumes you have a working ruby 1.9.3 environment)
    git clone https://github.com/evendis/cancannible_demo.git
    cd cancannible_demo
    bundle install

    # create and verify a db user (the app uses PostgreSQL by defualt)
    psql postgres -c "create role cancannible_demo with login superuser"
    psql postgres -U cancannible_demo -c "\c"

    # setup the database
    rake db:setup

    # now you are ready to go..
    rails s
    open http://localhost:3000

## Tests

Tests are written with [RSpec](https://www.relishapp.com/rspec/rspec-rails/docs) and are found in the [./spec](./spec) folder.

Only tests that specifically demonstrate cancannible-related behaviour are included, to avoid confusing the issue.
