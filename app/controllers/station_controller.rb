class StationController < ApplicationController
  skip_before_action :verify_authenticity_token

  def enter
    card = Card.find_by(number: params[:card_number])
    station = Station.find_by(name: params[:name])
    if card && station
      if Ride.where(card: card, destination: nil).any?
        render json: { error: 'Ride in progress' }, status: :bad_request
      else
        Ride.create!(card: card, origin: station)
        update_card_funds(card, station)
      end
    else
      render json: { error: 'Card or station not found' }, status: :not_found
    end
  end

  def exit
    card = Card.find_by(number: params[:card_number])
    station = Station.find_by(name: params[:name])
    ride = Ride.where(card: card, destination: nil).first
    if ride.present?
      ride.update(destination: station)
      render json: card, status: :ok
    else
      render json: { error: 'No ride in progress' }, status: :bad_request
    end
  end

  private

  def card_params
    params.permit(:number, :amount)
  end

  def update_card_funds(card, station)
    if card.amount >= station.train_lines.first.fare.to_f
      card.update(amount: card.amount - station.train_lines.first.fare.to_f)
      render json: card, status: :ok
    else
      render json: { error: 'Not enough funds' }, status: :bad_request
    end
  end
end
