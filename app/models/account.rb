class Account < ApplicationRecord
  belongs_to :account_type
  belongs_to :agency
  belongs_to :client

  has_and_belongs_to_many :moviments
end
