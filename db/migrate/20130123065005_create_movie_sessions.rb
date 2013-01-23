class CreateMovieSessions < ActiveRecord::Migration
  def change
    create_table :movie_sessions do |t|
      t.string :movie_edition
      t.float :price
      t.datetime :screening_date
      t.integer :movie_id
      t.integer :movie_theatre_id
      t.integer :screenning_room_id

      t.timestamps
    end
  end
end
