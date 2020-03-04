class FavoriteDirector < ApplicationRecord
  belongs_to :director
  belongs_to :user
end
