class StationController < ApplicationController
  skip_before_action :verify_authenticity_token

  def enter
    card = Card.find_by(number: params[:card_number])
    station = Station.find_by(name: params[:name])
    if card && station
      update_card_funds(card, station)
    else
      render json: { error: 'Card or station not found' }, status: :not_found
    end
  end

  def exit
    card = Card.find_by(number: params[:card_number])
    render json: card, status: :ok
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
