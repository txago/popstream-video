class AddThumbToMovie < ActiveRecord::Migration[5.2]
  def change
    add_column :movies, :thumb, :string
  end
end
