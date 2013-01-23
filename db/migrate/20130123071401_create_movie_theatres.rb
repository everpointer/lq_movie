class CreateMovieTheatres < ActiveRecord::Migration
  def change
    create_table :movie_theatres do |t|
      t.string :name
      t.string :city, limit: 10
      t.string :area, limit: 32
      t.string :address

      t.timestamps
    end
  end
end
