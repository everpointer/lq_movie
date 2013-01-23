class CreateScreeningRooms < ActiveRecord::Migration
  def change
    create_table :screening_rooms do |t|
      t.string :name
      t.text :seats
      t.string :order
      t.integer :movie_session_id
      t.integer :movie_theatre_id

      t.timestamps
    end
  end
end
