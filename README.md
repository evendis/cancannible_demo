# Cancannible Demo with Rails 3.2
[![Build Status](https://travis-ci.org/evendis/cancannible_demo.svg?branch=master)](https://travis-ci.org/evendis/cancannible_demo)

A Rails 3.2.x application that demonstrates how to use [Cancannible gem](https://github.com/evendis/cancannible) for role-based access permissions.

This can be used interactively at [cancannibledemo.evendis.com](http://cancannibledemo.evendis.com/).

See [cancannibledemo4.evendis.com](http://cancannibledemo4.evendis.com/) for the Rails 4.x version of the demo,
with source also on [GitHub](https://github.com/evendis/cancannible_demo4).

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

## Implementation Notes

The application uses [haml](http://haml.info/) for convenience and clarity. There's no dependency however; all this works fine with ERB or other view styles.

I'm also using [inherited_resources](https://github.com/josevalim/inherited_resources) for automatic RESTful bahaviour.
Yes, it is officially deprecated, but I've yet to find anything that is better than "zero code"!

However, you may not agree (and maybe I'll change my mind one day),
so the [customers_controller.rb](./app/controllers/customers_controller.rb) provides an example of how this all works with plain old controllers and standard ERB.
