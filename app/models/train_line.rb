# == Schema Information
#
# Table name: train_lines
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  fare       :decimal(5, 2)
#
class TrainLine < ApplicationRecord
  has_many :line_stations
  has_many :stations, through: :line_stations

  validates :name, presence: true
  validates :name, uniqueness: true
end
