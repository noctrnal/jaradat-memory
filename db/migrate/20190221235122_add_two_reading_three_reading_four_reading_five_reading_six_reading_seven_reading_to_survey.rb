class AddTwoReadingThreeReadingFourReadingFiveReadingSixReadingSevenReadingToSurvey < ActiveRecord::Migration[5.2]
  def change
    add_column :surveys, :two_reading, :integer, :default => 0
    add_column :surveys, :three_reading, :integer, :default => 0
    add_column :surveys, :four_reading, :integer, :default => 0
    add_column :surveys, :five_reading, :integer, :default => 0
    add_column :surveys, :six_reading, :integer, :default => 0
    add_column :surveys, :seven_reading, :integer, :default => 0
  end
end
