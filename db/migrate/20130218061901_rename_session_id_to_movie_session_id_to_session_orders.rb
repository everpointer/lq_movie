class RenameSessionIdToMovieSessionIdToSessionOrders < ActiveRecord::Migration
  def up
    rename_column :session_orders, :session_id, :movie_session_id
  end

  def down
    rename_column :session_orders, :movie_session_id, :session_id
  end
end
