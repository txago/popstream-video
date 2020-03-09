class Movie < ApplicationRecord
  include AlgoliaSearch

  belongs_to :director
  belongs_to :genre
  has_many :favorite_movies, dependent: :destroy
  validates :name, presence: true
  validates :description, presence: true
  validates :year, presence: true, numericality: { only_integer: true }
  validates :platform, presence: true
  validates :link, presence: true
  validates :country, presence: true
  validates :imdb_score, presence: true, numericality: { only_integer: true }
  validates :duration, presence: true, numericality: { only_integer: true }
  validates :trailer_url, presence: true

  include ImageUploader::Attachment(:image)

  algoliasearch per_environment: true do
    attributes :id, :name, :description, :year, :platform, :link, :country, :imdb_score, :duration, :genre_id, :director_id, :created_at, :image_data

    attribute :director do
      { name: director.name }
    end

    attribute :genre do
      { name: genre.name }
    end

    attribute (:poster_url) { image_url }

    attribute :image_data do
      { url: id }
    end

    attribute :image do
      { url: id }
    end

    attribute :created_at_i do
      created_at.to_i
    end

    searchableAttributes [:name, :description, :country, :director, :genre, :year, :duration, :platform, :link, :image_data]

    customRanking ['desc(imdb_score)']
  end
end
