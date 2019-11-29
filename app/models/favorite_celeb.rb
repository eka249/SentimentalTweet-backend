class FavoriteCeleb < ApplicationRecord
  belongs_to :user
  belongs_to :celeb
end