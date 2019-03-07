class Address < ApplicationRecord
  has_many :agency, dependent: :destroy
  has_many :employee_relation, dependent: :destroy
  has_many :Client, dependent: :destroy
end
