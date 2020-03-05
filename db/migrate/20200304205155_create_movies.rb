class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :name
      t.string :description
      t.integer :year
      t.string :platform
      t.string :link
      t.string :country
      t.integer :imdb_score
      t.integer :duration
      t.references :director, foreign_key: true
      t.references :genre, foreign_key: true

      t.timestamps
    end
  end
end
