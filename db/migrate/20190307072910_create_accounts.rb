class CreateAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :accounts do |t|
      t.string :name,             null: false
      t.integer :number,          null: false, unique:true
      t.string :agency,           null: false
      t.string :password_digest,  null:false
      t.string :token
      t.string :cpf,              null: false, unique: true
      t.float :current_amount,    default: 0.0
      t.float :credit,            default: 0.0

      t.timestamps
    end
  end
end
