class CreateJoinTableOfficesRules < ActiveRecord::Migration[5.1]
  def change
    create_join_table :offices, :rules do |t|
      # t.index [:office_id, :rule_id]
      # t.index [:rule_id, :office_id]
    end
  end
end
