class AddColumnToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :traveler_id, :integer, foreign_key:true 
    add_column :orders, :sender_id, :integer, foreign_key:true
  end
end
