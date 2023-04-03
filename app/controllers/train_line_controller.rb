# define controller for train lines
class TrainLineController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    ActiveRecord::Base.transaction do
      train_line = TrainLine.create!(train_line_params)
      previous_line_station = nil
      stations.each do |station|
        station = Station.find_or_create_by(name: station)
        previous_line_station.update(next_station_id: station.id) if previous_line_station.present?

        line_station = LineStation.create!(
          train_line: train_line,
          station: station,
          previous_station_id: previous_line_station&.station&.id
        )
        previous_line_station = line_station
      end

      render json: train_line, status: :created
    end
  end

  private

  def train_line_params
    params.permit(:name)
  end

  def stations
    params[:stations]
  end
end
