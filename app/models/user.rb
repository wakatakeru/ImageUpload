class User < ActiveRecord::Base
  has_many :images, dependent: :destroy
  has_secure_password

  validates :login_id,
            presence: true,
            uniqueness: true,
            format: { with: /\A[a-z0-9]+\z/i }
  
  validates :email,
            presence: true
  
  validates :password,
            presence: true,
            format: { with: /\A[a-z0-9]+\z/i },
            confirmation: true,
            on: :create

  private

  def validate_password?
    password.present? || password_confirmation.present?
  end

end
