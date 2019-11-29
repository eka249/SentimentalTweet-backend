  class Tweet < ApplicationRecord
    has_many :tweet_accounts
    has_many :celebs, through: :tweet_account
end