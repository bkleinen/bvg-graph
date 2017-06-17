class GraphexportController < ApplicationController
  def index
    s_bahn = Route.where(route_type: 109)
    u_bahn = Route.where(route_type: 400)
    @routes = s_bahn + u_bahn
  end
end
