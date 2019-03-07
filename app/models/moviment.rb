class Moviment < ApplicationRecord
  belongs_to :operation

  has_and_belongs_to_many :accounts
end
