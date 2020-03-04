class Director < ApplicationRecord
  has_many :movies
  has_many :favorite_directors, dependent: :destroy
end
