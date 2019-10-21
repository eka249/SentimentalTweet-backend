class Tweet < ApplicationRecord
    has_many :twitter_accounts, through: :tweet_accounts
    has_many :tweet_accounts

end
