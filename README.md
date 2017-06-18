# README

## SETUP of Docker Rails app

for setting up the rails app in docker, I've followed the instructions in:
https://docs.docker.com/compose/rails/

- but used alpine

docker-compose run bvg-graph rails new . --force --database=postgresql


# usage
    docker-compose up
    docker-compose exec bvg-graph bash


# copy the bvg data   
    - "../bvg-data:/usr/src/app/db/data"


docker-compose run bvg-graph bash


# Leaflet

- copied to vendor/leaflet, see http://guides.rubyonrails.org/asset_pipeline.html
- http://guides.rubyonrails.org/layouts_and_rendering.html#structuring-layouts
