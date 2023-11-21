class User < ApplicationRecord

  has_secure_password
  validates :name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, :password_confirmation, presence: true, length: { minimum: 4 }, inclusion: { in: :password_confirmation, if: :segment_type_present?}
  
  def segment_type_present?
    password.present? && password_confirmation.present?
  end

  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email)
    user.authenticate(password) ? user : nil
    #user && user.authenticate(password)
  end
end
