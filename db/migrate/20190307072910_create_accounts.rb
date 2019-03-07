class CreateAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :accounts do |t|
      t.integer :number,          null: false
      t.float :current_amount,    default: 0.0
      t.float :credit,            default: 0.0
      t.string :password_digest,  null:false
      t.belongs_to :account_type, foreign_key: true
      t.belongs_to :agency, foreign_key: true
      t.belongs_to :client, foreign_key: true

      t.timestamps
    end
  end
end
