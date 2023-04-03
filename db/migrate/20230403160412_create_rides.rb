class CreateRides < ActiveRecord::Migration[7.0]
  def change
    create_table :rides do |t|
      t.references :origin, null: true, foreign_key: { to_table: :stations }
      t.references :destination, null: true, foreign_key: { to_table: :stations }
      t.references :card, null: false, foreign_key: true
      t.timestamps
    end
  end
end
