class User < ApplicationRecord

  VALID_EMAIL_REGEXP = /\A\w+@\w+\.[a-z]+\z/
  VALID_NICKNAME_REGEXP = /\A[a-zA-Z_0-9]+\z/
  VALID_HEADER_REGEXP = /\A#\h{3}{1,2}\z/

  has_many :questions, dependent: :delete_all
  has_many :authored_question, class_name: 'Question', foreign_key: 'author_id', dependent: :nullify

  has_secure_password

  before_validation :downcase_nickname

  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEXP }

  validates :nickname, presence: true, uniqueness: true, length: { maximum: 40 }, format: { with: VALID_NICKNAME_REGEXP }

  validates :header_color, format: { with: VALID_HEADER_REGEXP }

  private

  def downcase_nickname
    nickname&.downcase!
  end
end
