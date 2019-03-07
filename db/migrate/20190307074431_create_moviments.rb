class CreateMoviments < ActiveRecord::Migration[5.1]
  def change
    create_table :moviments do |t|
      t.float :value,             default: 0.0
      t.datetime :operation_date
      t.belongs_to :operation, foreign_key: true

      t.timestamps
    end
  end
end
