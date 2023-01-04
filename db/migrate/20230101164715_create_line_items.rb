class CreateLineItems < ActiveRecord::Migration[7.0]
  def change
    create_table :line_items do |t|

      t.timestamps
      t.string :item 
      t.references :order
    end
  end
end
