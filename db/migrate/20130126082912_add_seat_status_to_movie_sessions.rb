class AddSeatStatusToMovieSessions < ActiveRecord::Migration
  def change
    add_column :movie_sessions, :seat_status, :text
  end
end
