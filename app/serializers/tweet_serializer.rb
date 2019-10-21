class TweetSerializer < ActiveModel::Serializer
  attributes :id, :content, :sentiment
end
