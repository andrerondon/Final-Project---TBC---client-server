class User < ApplicationRecord
    has_many :orders
    
    has_secure_password
    
    #to use the gem bcrypt

    # validates :last_name :email :password_digest, presence: true
 
end
