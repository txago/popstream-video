class CreateFavoriteMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :favorite_movies do |t|
      t.references :movie, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
