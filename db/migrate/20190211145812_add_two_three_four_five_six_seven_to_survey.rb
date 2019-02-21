class AddTwoThreeFourFiveSixSevenToSurvey < ActiveRecord::Migration[5.2]
  def change
    add_column :surveys, :two, :integer, :default => 0
    add_column :surveys, :three, :integer, :default => 0
    add_column :surveys, :four, :integer, :default => 0
    add_column :surveys, :five, :integer, :default => 0
    add_column :surveys, :six, :integer, :default => 0
    add_column :surveys, :seven, :integer, :default => 0
  end
end
