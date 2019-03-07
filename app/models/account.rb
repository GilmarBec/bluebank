class Account < ApplicationRecord
  has_secure_password
  include BCrypt

  belongs_to :account_type
  belongs_to :agency
  belongs_to :client

  has_and_belongs_to_many :moviments
end
