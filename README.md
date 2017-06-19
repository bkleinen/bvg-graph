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

## Test in Production mode

14:45:37-kleinen~/mine/current/code/bvg/bvg-graph-docker (master)$ export SECRET_KEY_BASE=b3d42b43ed6bed4534775565e55bac587a3278da429288bd95dbce9653d3859d6217b074a05b1a519840a9f1ceec945eaf44b1985f34ceef94f8916b2093b727
14:45:47-kleinen~/mine/current/code/bvg/bvg-graph-docker (master)$ docker-compose -f docker-compose-prd.yml up

# Leaflet

- copied to vendor/leaflet, see http://guides.rubyonrails.org/asset_pipeline.html
- http://guides.rubyonrails.org/layouts_and_rendering.html#structuring-layouts
