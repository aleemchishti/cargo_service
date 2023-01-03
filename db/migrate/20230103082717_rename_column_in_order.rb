class RenameColumnInOrder < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :from, :string
    add_column :orders, :to, :string
    rename_column :orders, :weight, :weight_in_kgs
    remove_column :orders, :destination, :string
  end
end
