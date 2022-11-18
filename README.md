# Python Django Example Project

## Django Setup

Already done for this project:

    $ docker build -t django-project .
    $ docker run -it --name django-project --rm \
        --volume $(pwd):/code \
        --net=host django-project:latest \
        bash
    $ django-admin startproject example

## Pre-commit Setup

    $ pre-commit install --hook-type commit-msg
    $ pre-commit install --hook-type pre-commit
    $ pre-commit install --hook-type pre-push

## Running

Run your local environment do:

    $ docker compose up --remove-orphans

## Commands

To run any other command on the app container you can do:

    $ docker compose exec web python example/manage.py shell
    $ docker compose exec web pytest
    $ docker compose exec web bash
    $ docker compose exec web prospector


## Add python packages

Add the package name to the `requirements.in` or `dev-requirements.in` file and run:

    $ docker compose exec web pip-compile --generate-hashes requirements.in
    $ docker compose exec web pip-compile --generate-hashes dev-requirements.in


## Add javascript packages

To add a javascript package run:

    $ docker compose exec web pnpm add alabaster@1.1.12


## Upgrade packages

To upgrade js packages run:

    $ docker compose exec web pnpm upgrade-interactive

For python packages run:

    $ docker compose exec web pip-compile --generate-hashes --upgrade requirements.in
    $ docker compose exec web pip-compile --generate-hashes --upgrade dev-requirements.in
    $ git add requirements.in dev-requirements.in && git commit -m "Upgraded packages"
    $ ./update-docker-image.sh

To upgrade pre-commit versions:

    $ pre-commit autoupdate
