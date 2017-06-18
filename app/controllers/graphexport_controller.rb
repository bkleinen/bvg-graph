class GraphexportController < ApplicationController
  before_action :set_routes

  def index
    lt = @routes.map { |r| [r.id, r.longest_trip]}
    @longest_trips = lt.to_h
  end

  def graph
    @longest_trips = @routes.map { |r| r.longest_trip}
    @hops = @longest_trips.map{|t| t.hops }
    @hops.flatten!
    @graph = Hop.graph(@hops)
  end

private
  def set_routes
    s_bahn = Route.where(route_type: 109)
    u_bahn = Route.where(route_type: 400)
    @routes = (s_bahn + u_bahn).select {|r| ["796","1"].include?(r.agency_identifier) }
  end
end
