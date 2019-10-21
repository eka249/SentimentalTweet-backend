class FavoriteAccount < ApplicationRecord
  belongs_to :user
  belongs_to :twitter_account
end
