class CreateEmployeeRelatings < ActiveRecord::Migration[5.1]
  def change
    create_table :employee_relatings do |t|
      t.belongs_to :employee, foreign_key: true
      t.belongs_to :address, foreign_key: true
      t.belongs_to :office, foreign_key: true

      t.timestamps
    end
  end
end
