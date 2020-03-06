class Director < ApplicationRecord
  has_many :movies
  has_many :favorite_directors, dependent: :destroy
  has_one_attached :photo
end
