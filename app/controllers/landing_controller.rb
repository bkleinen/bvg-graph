class LandingController < ApplicationController
  require "#{Rails.root}/lib/bvg-import/files_to_tables.rb"
  include BVG
  def index

    all_ds = data_sources
    clazzes =  all_ds.map{|ds2| ds2.clazz}

  end
end
