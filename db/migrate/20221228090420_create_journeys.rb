class CreateJourneys < ActiveRecord::Migration[7.0]
  def change
    create_table :journeys do |t|
      t.string :from
      t.string :to
      t.datetime :departure
      t.integer :rate
      t.integer :capacity

      t.timestamps
    end
  end
end
