class User < ApplicationRecord
  has_secure_password

  VALID_EMAIL_REGEXP = /\A\w+@\w+\.[a-z]+\z/
  VALID_NICKNAME_REGEXP = /\A[a-zA-Z_0-9]+\z/
  VALID_HEADER_REGEXP = /\A#[a-f0-9]{6}\z/i

  before_validation :downcase_nickname

  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEXP }

  validates :nickname, presence: true, uniqueness: true, length: { maximum: 40 }, format: { with: VALID_NICKNAME_REGEXP }

  validates :header_color, format: {with: VALID_HEADER_REGEXP}

  private

  def downcase_nickname
    nickname&.downcase!
  end
end
