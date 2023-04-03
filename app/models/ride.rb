# == Schema Information
#
# Table name: rides
#
#  id             :bigint           not null, primary key
#  origin_id      :bigint
#  destination_id :bigint
#  card_id        :bigint           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class Ride < ApplicationRecord
  belongs_to :card
  belongs_to :origin, class_name: 'Station'
  belongs_to :destination, class_name: 'Station', optional: true

  validates :card, presence: true
end
