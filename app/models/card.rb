# == Schema Information
#
# Table name: cards
#
#  id         :bigint           not null, primary key
#  number     :string           not null
#  amount     :decimal(5, 2)    not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Card < ApplicationRecord
  validates :number, presence: true, uniqueness: true
end
