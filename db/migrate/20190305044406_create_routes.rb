class CreateRoutes < ActiveRecord::Migration[5.1]
  def change
    create_table :routes do |t|
      t.string :name, unique:true
      t.string :path, unique:true
      t.string :method
      t.string :group

      t.timestamps
    end
  end
end
