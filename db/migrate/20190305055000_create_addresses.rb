class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.string :cep
      t.string :state
      t.string :city
      t.string :district
      t.string :street
      t.integer :number

      t.timestamps
    end
  end
end
