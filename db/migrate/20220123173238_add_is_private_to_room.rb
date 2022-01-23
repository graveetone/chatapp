class AddIsPrivateToRoom < ActiveRecord::Migration[7.0]
  def change
    add_column :rooms, :isprivate, :boolean, default: false 
  end
end
