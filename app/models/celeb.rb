class Celeb< ApplicationRecord
    # has_many :favorite_celebs
    # has_many :tweet_accounts
    has_many :users, through: :favorite_celebs
    has_many :tweets, through: :tweet_account
    # belongs_to :tweet
    
end