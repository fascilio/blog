class User < ApplicationRecord
    validates :email, presence: true, uniqueness: true
    has_one :profile
    has_secure_password
end
