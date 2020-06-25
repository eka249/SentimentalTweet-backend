class FavoriteCelebSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :celeb_id
end
