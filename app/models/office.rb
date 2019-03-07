class Office < ApplicationRecord
  has_many :employee_relating, dependent: :destroy

  has_and_belongs_to_many :rules
end
