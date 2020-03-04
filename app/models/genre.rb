class Genre < ApplicationRecord
  has_many :movies
  has_many :favorite_genres, dependent: :destroy
end
