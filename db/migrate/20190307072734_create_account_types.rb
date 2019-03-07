class CreateAccountTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :account_types do |t|
      t.string :name, unique:true
      t.integer :code, unique:true

      t.timestamps
    end
  end
end
