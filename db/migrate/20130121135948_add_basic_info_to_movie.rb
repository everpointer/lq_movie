class AddBasicInfoToMovie < ActiveRecord::Migration
  def change
    add_column :movies, :author, :string
    add_column :movies, :cast, :string
    add_column :movies, :movie_type, :string
    add_column :movies, :pubdate, :date
    add_column :movies, :country, :string
    add_column :movies, :language, :string
    add_column :movies, :movie_duration, :integer
    add_column :movies, :movie_edition, :string
    add_column :movies, :rating, :float
    add_column :movies, :summary, :text
  end
end
