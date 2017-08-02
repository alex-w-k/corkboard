# README

Original Repo from Sprint 1 (1701BE): git@github.com:NicholasJacques/corkboard.git
Repo from Sprint 2 (1703BE): https://github.com/Benjaminpjacobs/corkboard

This is a project that clones [Thumbtack](https://www.thumbtack.com/).  We used:
- Rails 5.0.4
- PostgreSQL
- Ruby

## To Try the project yourself:
In Terminal
- Clone this repo into that directory
- `cd corkboard`
- Run `bundle`
- Finally, run `rake db:setup to setup and seed your database

### RSpec test suite and Checking Coverage with SimpleCov

Start by running our test suite.

  * Enter `rspec` on the command line to run the test suite.
  * Next, enter `open coverage/index.html` on the command line to see test coverage.

### Running the server locally

  * To start up the server from within the project, run `rails s`.
  * Then, visit your browser and start exploring!
  * Type `ctrl-c` to stop the server and return to the command line.

### Features

#### Action Cable
When a Pro submits a bid for a project, a real-time chat messaging system is initialized on the bid. Messaging uses Rails' built-in ActionCable module in conjunction with a Redis server in order to enable a chat channel scoped to the specific bid. To use, login as a Pro, find a project, create a bid and chat away.

#### AJAX
In the User's dashboard, users can manage their projects. Projects are rendered via AJAX calls to an internal API. Accepted projects can be marked as "Complete." This functionality is also provided by AJAX calls to an internal API, secured by an encoded JWS token. Click on a completed project to leave a review for the pro. -- Charlie

#### Capistrano

#### React Homepage
