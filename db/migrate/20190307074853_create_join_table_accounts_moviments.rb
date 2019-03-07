class CreateJoinTableAccountsMoviments < ActiveRecord::Migration[5.1]
  def change
    create_join_table :accounts, :moviments do |t|
      # t.index [:account_id, :moviment_id]
      # t.index [:moviment_id, :account_id]
    end
  end
end
