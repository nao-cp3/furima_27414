class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :text,              null: false
      t.string :name,              null: false
      t.integer :category_id,      null: false
      t.integer :condition_id,     null: false
      t.integer :postage_id,       null: false
      t.integer :prefecture_id,    null: false
      t.integer :several_days_id,  null: false
      t.integer :prices,           null: false
      t.references :user,          null: false, foreign_key: true
      t.timestamps
    end
  end
end
