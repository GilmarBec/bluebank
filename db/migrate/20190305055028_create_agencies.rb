class CreateAgencies < ActiveRecord::Migration[5.1]
  def change
    create_table :agencies do |t|
      t.integer :number, unique:true
      t.belongs_to :address, foreign_key: true

      t.timestamps
    end
  end
end
