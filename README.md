# Connect Turing

This website streamlines the mentor-mentee process.  Users can create an account, request to be mentored by other users, and accept/reject requests from other users.

## Setup

### This app was created in:
Ruby version - ruby 2.3.1p112
Rails version - Rails 5.1.4
Database - PostgreSQL

### Running the App (Locally) -
In terminal (within the local directory), enter the following commands:
1. 'bundle' or 'bundle install'

  * installs gems listed in *Gemfile*

2. 'rails db:create db:migrate db:seed'

  * Creates and populates **development** database
  * 'db:seed' runs the *db/seeds.rb* file, which is set up to populate the database

3. 'rails s'

  * Starts up local development server

You are now able to open up your browser and go to the url provided in the last line within the terminal to visit the website:
* *Listening on tcp://0.0.0.0:3000*
* You'd visit '*0.0.0.0:3000*' in your browser.

## Running the test suite
In terminal, enter the following commands:
1. 'rails db:test:prepare'

  * Creates **test** database - which is separate from the **development** database

2. 'rspec'

  * runs the full test suite
  * finds files that end in '`_`spec.rb'
