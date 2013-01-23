class RenameScreenningRoomId < ActiveRecord::Migration
  def up
    rename_column :movie_sessions, :screenning_room_id, :screening_room_id
  end

  def down
  end
end
