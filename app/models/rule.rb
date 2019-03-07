class Rule < ApplicationRecord
  belongs_to :route

  has_and_belongs_to_many :offices
end
