# README

This application is to didactic purpose only. The goal is to run two applications simultaneously in two separate docker containers. This is one of the application, an bookstore where de client will buy books, generating a charge through an api, which is the other application.

* Ruby version 3.0.3
* Rails version ">= 6.1.4.4"
* Docker Compose version 3
* Node version 16

* Gems added:
  - capybara
  - factory_bot_rails
  - faraday
  - rspec-rails
  - rubocop-rails
  - simplecov

* Database
  - postgres:14.1-alpine

* Configuration/Initialization
  - This project uses Docker, docker installation procedure can be found on the official website (https://www.docker.com/). Another option is to install locally the dependencies (yarn, nodejs and ruby). From now on it's assumed that docker is being used. All prerequisites are in Dockerfile.
  - To run the project, follow the next steps.
    - Build an image running, in the computer terminal, inside the project folder, the command:
      - docker-compose build
    - Generate a container running, in the computer terminal, inside the project folder, the command:
      - docker-compose run --service-ports rails bash
    - Install dependencies running, in the container terminal, inside the project folder, the command:
      - bundle install
    - Update the image (do it whenever new gems are installed, after running bundle install)
      - docker-compose build
    - Enter 'exit' to close the container terminal
  - To execute the application:
    - First: run docker-compose up, in the computer terminal, inside this project folder
    - Second: run docker-compose up, in the computer terminal, inside the other application folder. This application is in another repository, called "first_api_docker" (https://github.com/MarianaCRuiz/first_api_docker)
    - Third: go to your browser, access http://localhost:3000

* How to run the test suite
  - rspec
