class User < ActiveRecord::Base
  validates :login_id,
            presence: true,
            uniqueness: true
  
  validates :email,
            presence: true
  
  validates :password,
            presence: true,
            format: { with: /\A[a-z0-9]+\z/i }
  
end
