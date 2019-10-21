class FavoriteAccountSerializer < ActiveModel::Serializer
  attributes :id
  has_one :user
  has_one :twitter_account
end
