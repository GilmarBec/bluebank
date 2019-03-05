class CreateOfficeRelatings < ActiveRecord::Migration[5.1]
  def change
    create_table :office_relatings do |t|
      t.belongs_to :route, foreign_key: true
      t.belongs_to :office, foreign_key: true

      t.timestamps
    end
  end
end
