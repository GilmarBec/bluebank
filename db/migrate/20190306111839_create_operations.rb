class CreateOperations < ActiveRecord::Migration[5.1]
  def change
    create_table :operations do |t|
      t.string :name, unique:true
      t.string :code, unique:true

      t.timestamps
    end
  end
end
