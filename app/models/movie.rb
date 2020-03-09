class Movie < ApplicationRecord
  include AlgoliaSearch

  belongs_to :director
  belongs_to :genre
  has_many :favorite_movies, dependent: :destroy
  has_one_attached :photo
  validates :name, presence: true
  validates :description, presence: true
  validates :year, presence: true, numericality: { only_integer: true }
  validates :platform, presence: true
  validates :link, presence: true
  validates :country, presence: true
  validates :imdb_score, presence: true, numericality: { only_integer: true }
  validates :duration, presence: true, numericality: { only_integer: true }
  validates :trailer_url, presence: true

  after_touch :index!

  algoliasearch per_environment: true do
    attributes :photo, :id, :created_at, :name, :description, :year, :platform, :link, :country, :imdb_score, :duration, :genre_id, :director_id

    attribute :director do
      { name: director.name }
    end

    attribute :genre do
      { name: genre.name }
    end

    attribute :created_at_i do
      created_at.to_i
    end

    searchableAttributes [:name, :description, :country, :director, :genre, :year, :duration, :platform, :link, :photo]

    customRanking ['desc(imdb_score)']
  end
end
