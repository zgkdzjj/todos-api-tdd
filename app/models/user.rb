class User < ApplicationRecord
  # encrypt password
  has_secure_password

  # Model association
  has_many :todos, foreign_key: :created_by
  # Validations
  validates :name, :email, :password_digest, presence: true
end
