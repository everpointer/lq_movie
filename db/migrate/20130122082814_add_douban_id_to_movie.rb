class AddDoubanIdToMovie < ActiveRecord::Migration
  def change
    add_column :movies, :douban_id, :string, limit: 32
    add_column :movies, :is_screening, :boolean, default: false  
  end
end
