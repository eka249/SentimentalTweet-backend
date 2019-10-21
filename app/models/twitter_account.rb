class TwitterAccount < ApplicationRecord
    has_many :favorite_accounts
    has_many :tweet_accounts
    has_many :users, through: :favorite_accounts
    has_many :tweets, through: :tweet_account
    
end
