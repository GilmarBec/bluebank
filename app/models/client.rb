class Client < ApplicationRecord
  has_secure_password
  include BCrypt

  belongs_to :address
end
