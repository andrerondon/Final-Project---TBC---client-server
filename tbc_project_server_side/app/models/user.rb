class User < ApplicationRecord
    has_many :orders
    
    has_secure_password
    
    #to use the gem bcrypt

    validates(:email, presence: true, uniqueness: true, format: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i)
    # validates :last_name :email :password_digest, presence: true
 
end
