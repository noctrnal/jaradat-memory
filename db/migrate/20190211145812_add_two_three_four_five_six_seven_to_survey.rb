class AddTwoThreeFourFiveSixSevenToSurvey < ActiveRecord::Migration[5.2]
  def change
    add_column :surveys, :two, :integer
    add_column :surveys, :three, :integer
    add_column :surveys, :four, :integer
    add_column :surveys, :five, :integer
    add_column :surveys, :six, :integer
    add_column :surveys, :seven, :integer
  end
end
