class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :favorite_directors, dependent: :destroy
  has_many :favorite_genres, dependent: :destroy
  has_many :favorite_movies, dependent: :destroy
  def favorited?(movie)
    FavoriteMovie.find_by(user: self, movie: movie)
  end
end


