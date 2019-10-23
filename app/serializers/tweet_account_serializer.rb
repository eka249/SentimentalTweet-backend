class TweetAccountSerializer < ActiveModel::Serializer
  attributes :id, :tweet
  has_one :celeb_username
end
