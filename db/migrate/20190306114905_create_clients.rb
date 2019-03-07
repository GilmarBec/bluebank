class CreateClients < ActiveRecord::Migration[5.1]
  def change
    create_table :clients do |t|
      t.string :name,             null: false
      t.string :token
      t.string :cpf,              null: false, unique: true
      t.string :login,            null: false, unique: true
      t.string :email,            null: false, unique: true
      t.string :password_digest,  null: false
      t.belongs_to :address, foreign_key: true

      t.timestamps
    end
  end
end
