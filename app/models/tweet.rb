  
class Tweet < ApplicationRecord
    has_many :celebs, through: :tweet_account
    has_many :tweet_accounts

end