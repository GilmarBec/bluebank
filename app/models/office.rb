class Office < ApplicationRecord
  has_many :employee_relating, dependent: :destroy
  has_many :office_relating, dependent: :destroy
end
