# README

This is a rails application to experiment with the Open Data made accessible
in GTFS-Format by VBB, see [http://www.vbb.de/de/article/fahrplan/webservices/datensaetze/1186967.html](http://www.vbb.de/de/article/fahrplan/webservices/datensaetze/1186967.html)


## SETUP of Docker Rails app

for setting up the rails app in docker, I've followed the instructions in:
https://docs.docker.com/compose/rails/

- but used alpine

docker-compose run bvg-graph rails new . --force --database=postgresql


# usage
    docker-compose up
    docker-compose exec bvg-graph bash


# Import BVG-Data



## Test in Production mode

 export SECRET_KEY_BASE=<top secret> # e.g. generate with rake secret
 docker-compose -f docker-compose-prd.yml up

# Leaflet

- copied to vendor/leaflet, see http://guides.rubyonrails.org/asset_pipeline.html
- http://guides.rubyonrails.org/layouts_and_rendering.html#structuring-layouts
