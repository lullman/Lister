class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.integer :list_id
      t.string :item_name, null: false
      t.string :url
      t.integer :suggested_by
      t.boolean :purchased, default: false

      t.timestamps
    end
  end
end
