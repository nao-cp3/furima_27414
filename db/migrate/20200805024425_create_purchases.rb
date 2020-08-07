class CreatePurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases do |t|
      t.bigint :user_id,     null: false, foreign_key: true
      t.bigint :item_id,     null: false, foreign_key: true
      t.timestamps
    end
  end
end
