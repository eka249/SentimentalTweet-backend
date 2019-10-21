class TweetAccountSerializer < ActiveModel::Serializer
  attributes :id, :tweet
  has_one :twitter_account
end
