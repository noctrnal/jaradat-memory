class AddVeracityToEquation < ActiveRecord::Migration[5.2]
  def change
    add_column :equations, :veracity, :boolean
  end
end
