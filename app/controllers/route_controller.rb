# define controller for train lines
class RouteController < ApplicationController
  def shortest_route
    route = get_route(origin, destination)
    render json: route, status: :ok
  end

  private

  def origin
    Station.find_by(name: params[:origin])
  end

  def destination
    Station.find_by(name: params[:destination])
  end

  def get_route(origin, destination)
    return unless origin && destination

    queue = [[origin, [origin.name]]]
    visited = []

    until queue.empty?
      current_station, current_route = queue.shift
      return current_route if current_station == destination

      visited << current_station
      current_station.reachable_stations.each do |next_station|
        next if visited.include?(next_station)

        queue << [next_station, current_route + [next_station.name]]
      end
    end

    nil
  end
end
