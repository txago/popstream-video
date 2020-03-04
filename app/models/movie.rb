class Movie < ApplicationRecord
  belongs_to :director
  belongs_to :genre
  has_many :favorite_movies, dependent: :destroy
end
