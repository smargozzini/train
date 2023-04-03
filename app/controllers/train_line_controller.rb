# define controller for train lines
class TrainLineController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    ActiveRecord::Base.transaction do
      if TrainLine.find_by(name: params[:name])
        render json: { error: 'Train line already exists' }, status: :bad_request
        return
      end
      train_line = TrainLine.create!(train_line_params)
      previous_line_station = nil
      stations.each do |station_name|
        station = Station.find_or_create_by(name: station_name)
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
    params.permit(:name, :fare)
  end

  def stations
    params[:stations]
  end
end
