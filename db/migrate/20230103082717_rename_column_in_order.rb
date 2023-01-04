class RenameColumnInOrder < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :sender_name, :string
    add_column :orders, :receiver_name, :string
    add_column :orders, :weight, :integer
    add_column :orders, :contact, :integer
    add_column :orders, :from, :string
    add_column :orders, :to, :string
  end
end
