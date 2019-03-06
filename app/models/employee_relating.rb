class EmployeeRelating < ApplicationRecord
  belongs_to :employee
  belongs_to :address
  belongs_to :office
end
