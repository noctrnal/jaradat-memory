class ChangeColumnNames < ActiveRecord::Migration[5.2]
  def change
    rename_column :surveys, :two, :two_memory
    rename_column :surveys, :three, :three_memory
    rename_column :surveys, :four, :four_memory
    rename_column :surveys, :five, :five_memory
    rename_column :surveys, :six, :six_memory
    rename_column :surveys, :seven, :seven_memory
  end
end
