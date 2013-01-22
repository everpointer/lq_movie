class AddBasicInfoToMovie < ActiveRecord::Migration
  def change
    add_column :movies, :director, :text
    add_column :movies, :cast, :text
    add_column :movies, :movie_type, :text
    add_column :movies, :pubdate, :text
    add_column :movies, :country, :text
    add_column :movies, :language, :text
    add_column :movies, :movie_duration, :integer
    add_column :movies, :movie_edition, :text
    add_column :movies, :rating, :text
    add_column :movies, :summary, :text
  end
end
