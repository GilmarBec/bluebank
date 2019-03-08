class CreateTransferences < ActiveRecord::Migration[5.1]
  def change
    create_table :transferences do |t|
      t.belongs_to :account, foreign_key: true
      t.integer :account_receiver_id
      t.float :value, default: 0.0

      t.timestamps
    end
  end
end
