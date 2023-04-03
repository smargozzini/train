# define controller for train lines
class CardController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    card = Card.find_by(number: params[:number])
    if card
      render json: { error: 'Card already exists' }, status: :bad_request
    else
      card = Card.create!(card_params)
      render json: card, status: :created
    end
  end

  private

  def card_params
    params.permit(:number, :amount)
  end
end
