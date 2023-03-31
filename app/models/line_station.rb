# == Schema Information
#
# Table name: line_stations
#
#  id                  :bigint           not null, primary key
#  train_line_id       :bigint           not null
#  station_id          :bigint           not null
#  next_station_id     :bigint
#  previous_station_id :bigint
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
class LineStation < ApplicationRecord
  belongs_to :train_line
  belongs_to :station
  belongs_to :next_station, class_name: 'Station', optional: true
  belongs_to :previous_station, class_name: 'Station', optional: true
end
