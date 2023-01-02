class AddReferenceToJourney < ActiveRecord::Migration[7.0]
  def change
    add_reference :journeys, :user, foreign_key:true 
  end
end
