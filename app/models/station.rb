# == Schema Information
#
# Table name: stations
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Station < ApplicationRecord
  has_many :line_stations
  has_many :train_lines, through: :line_stations

  validates :name, presence: true

  def reachable_stations
    reachable_stations = []
    line_stations.each do |line_station|
      reachable_stations << line_station.next_station
      reachable_stations << line_station.previous_station
    end
    reachable_stations.compact.uniq
  end
end
