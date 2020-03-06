class Movie < ApplicationRecord
  include AlgoliaSearch

  algoliasearch do
    attributes :name, :description
  end

  belongs_to :director
  belongs_to :genre
  has_many :favorite_movies, dependent: :destroy
  has_one_attached :photo
end
