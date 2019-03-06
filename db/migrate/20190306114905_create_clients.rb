class CreateClients < ActiveRecord::Migration[5.1]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :cpf
      t.string :email
      t.string :password_digest
      t.belongs_to :address, foreign_key: true

      t.timestamps
    end
  end
end
