class AddTrailerUrlToMovies < ActiveRecord::Migration[5.2]
  def change
    add_column :movies, :tailer_url, :string
  end
end
