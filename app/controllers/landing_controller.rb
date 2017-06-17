class LandingController < ApplicationController
  require "#{Rails.root}/lib/bvg-import/files_to_tables.rb"
  include BVG
  def index

    all_ds = data_sources
    @clazzes =  all_ds.map{|ds2| c = ds2.clazz ; [c.pluralize, "#{c.constantize.table_name}_path"]}

  end
end
