class RemoveVeracityFromEquation < ActiveRecord::Migration[5.2]
  def change
    remove_column :equations, :veracity, :text
  end
end
