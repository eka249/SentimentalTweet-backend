class User < ApplicationRecord
    has_secure_password
    has_many :favorite_accounts
    has_many :twitter_accounts, through: :favorite_account
    
end
