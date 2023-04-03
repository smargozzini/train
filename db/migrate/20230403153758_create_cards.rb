class CreateCards < ActiveRecord::Migration[7.0]
  def change
    create_table :cards do |t|
      t.string :number, null: false
      t.decimal :amount, precision: 5, scale: 2, null: false
      t.timestamps
    end
  end
end
