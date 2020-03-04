class CreateFavoriteDirectors < ActiveRecord::Migration[5.2]
  def change
    create_table :favorite_directors do |t|
      t.references :director, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
