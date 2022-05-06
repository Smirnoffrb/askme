class User < ApplicationRecord
  has_secure_password

  VALID_EMAIL_REGEXP = /\A\w+@\w+\.[a-z]+/
  VALID_NICKNAME_REGEXP = /\A[a-zA-Z_1-9]+\z/


  before_save :downcase_nickname

  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEXP }

  validates :nickname, uniqueness: true, length: { maximum: 40 }, format: { with: VALID_NICKNAME_REGEXP }

  def downcase_nickname
    nickname.downcase!
  end
end
