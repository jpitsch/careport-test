# Patient Visits Viewer

# Getting Started

## Prereqs
you'll need [docker](https://docs.docker.com/get-docker/) and [docker-compose](https://docs.docker.com/compose/install/).
Alternately you could also run this without docker, you'll need postgres running locally and update the `config/database.yml` file with the creds. We'll assume docker-compose going forward, however

## Docker set up
1. Once you have docker-compose, build the images in docker compose with `docker-compose build`

2. After the build completes, run the setup: `docker-compose run --rm console rake db:setup`. You may see "Waiting for database" a few times, this is just the db doing initial setup.

3. run the app with `docker-compose up` and at `localhost:3000` you should see the patient visits viewer

We have three services:
- db is the database with mounted data directory `./postgres-data` so data isn't lost between rebuilds
- web is the rails server running on port 3000
- console is a bash cli for running rake commands, tests, etc.


# The App
We are building an analytics app meant to give a higher-level view into our clients'
patient visits data. Our clients are hospitals, who are responsible for those
patients that it sends to a post acute care (PAC) after treatment.

The sorts of questions they are trying to answer are:
- How many of our patients are at each PAC?
- Which PACs are more effective?
- Which attributes might be indicative of a patient's progress?

## The Visits table
The data present in this app is ETL'd from another app that has more detailed
patient visit level data. We have ETL'd this data into this single cache table


# The Excercise
We plan to use this code base for the coding portions of the interview so we are all
working off of a project we all have familiarity with / no surprises. We tried
our best to have this mimic the kind of application we work on.

Please don't take more than an hour on this. There will be an opportunity to go
over your solution so you'll be able to talk through any part that you weren't
able to complete in time. Focus your time primarily on the hard parts of the excercise

## Visit Code dropdown
Our clients need to filter by the `visits` table's `code` field.
These codes are sent to us by the client. In our system they are arbitrary
tags applied to a visit, indicating some piece of data important to the client.

Add a "Tracking Code" dropdown to the hospital view page. Its contents should be
all the codes present in the hospital's data set, and the value to the user in
the dropdown should be the name of the code.

## What we are looking for
There is only so much you can learn from a takehome test like this. From a high level, we will be looking at:

- Are you able to grasp the domain and present a solution that solves the problems described?
- How comfortable are you with the underlying technologies
- How are you leveraging tests? Are the tests easy to read and are testing the right things in useful ways?
- Is your code well organized and readable? Does it add to the apps complexity, or aid in understanding the inherent complexity of the data? Is it easily extensible?
- Would this dropdown also be easily added to the visits page as well?
