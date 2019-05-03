# Blog Sports

Blog Sports is a Ruby on Rails application where users can search for intramural sports leagues within their cities and create or join teams within those leagues. Watch the [demo video here](https://www.youtube.com/watch?v=JzjW8_AQT7o&feature=youtu.be).

This repository welcomes contributions, so feel free to submit a pull request!

## Installation

1. Clone the repository by running `git clone git@github.com:cfinn16/intramural-sports-project.git`
2. `cd intramural-sports-project`
3. `bundle install` to install necessary gems
4. `rake db: create && rake db:migrate` to create the databse
5. `rake db:seed` to populate the database with seed data
6. `rails s` to start the server.
7. Open <http://localhost:3000/> in a browser to use the app.

## If You're New to Ruby on Rails

All of the views that control what is displayed on the page can be found under `app/views`. These files are written in ERB, which is a way to embed Ruby in an HTML file. Any action triggered by an action in a view will point to a command in the corresponding controller (`app/controllers`). You can find the schema for this app under `db/schema.rb`.

## Models

There are five models Blog Sports uses, and they can all be found under `app/models`:

### City

The `City` model is the most high-level model in the schema. Each city has a `name` and has many `League`s. The `City` model also comes with a method to determine the most popular league in each city by sorting them by the number of teams they have.

### League

The `League` model is one of the more code-heavy models in the schema. Each `League` belongs to a `City` and has many `Team`s. A league has several attributes, as it is necessary to know the sport, day of the week, cost to join, and experience level for any IM sports league. The `League` model contains a series of validations for these attributes so that any new league created by the user has normalized data.

### Team

Each `Team` belongs to a `League` and has many `Player`s through `TeamPlayer`s (more details on that in the next section). The `Team` model validates for the presence of a name that they must be 5 characters long to discourage names shorter than a full word.

### TeamPlayer

The `TeamPlayer` model is a join table between the `Team` model and `Player` model. Since each team has many players and each individual can be on multiple teams, it is necessary to have a join to facilitate this many-to-many relationship. Each `TeamPlayer` belongs to a `Team` and to a `Player`

### Player

Each `Player` has_many `Team`s through `TeamPlayer`s. The `Player` model has several validations in place to make sure the user enters a full name and uses a correctly formatted, unique email address when they sign up. 
