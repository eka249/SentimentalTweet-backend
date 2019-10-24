  
class Tweet < ApplicationRecord
    has_many :celebs, through: :tweet_accounts
    has_many :tweet_accounts

end