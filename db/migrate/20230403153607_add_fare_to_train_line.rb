class AddFareToTrainLine < ActiveRecord::Migration[7.0]
  def change
    add_column :train_lines, :fare, :decimal, precision: 5, scale: 2
  end
end
