class User < ApplicationRecord
    has_secure_password
    has_many :favorite_celebs
    has_many :celebs, through: :favorite_celeb
    validates :username, uniqueness: { case_sensitive: true }
end
