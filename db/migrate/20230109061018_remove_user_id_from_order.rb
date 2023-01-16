class RemoveUserIdFromOrder < ActiveRecord::Migration[7.0]
  def change
    remove_column :orders, :user_id, :integer
  end
end
