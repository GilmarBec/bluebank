class CreateRules < ActiveRecord::Migration[5.1]
  def change
    create_table :rules do |t|
      t.boolean :status
      t.belongs_to :route, foreign_key: true

      t.timestamps
    end
  end
end
