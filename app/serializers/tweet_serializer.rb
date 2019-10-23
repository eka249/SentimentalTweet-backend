class TweetSerializer < ActiveModel::Serializer
  attributes :id, :content, :sentiment, :celeb_username
end
