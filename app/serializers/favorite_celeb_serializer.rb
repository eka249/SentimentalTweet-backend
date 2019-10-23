class FavoriteCelebSerializer < ActiveModel::Serializer
  attributes :id
  has_one :user
  has_one :celeb
end
