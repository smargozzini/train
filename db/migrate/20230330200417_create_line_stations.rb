class CreateLineStations < ActiveRecord::Migration[7.0]
  def change
    create_table :line_stations do |t|
      t.references :train_line, null: false, foreign_key: true
      t.references :station, null: false, foreign_key: true
      t.references :next_station, null: true, foreign_key: { to_table: :stations }
      t.references :previous_station, null: true, foreign_key: { to_table: :stations }
      t.timestamps
    end
  end
end
