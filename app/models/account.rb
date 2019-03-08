class Account < ApplicationRecord
  has_secure_password
  include BCrypt

  has_many :transference, dependent: :destroy
end
