class AddPublicToLists < ActiveRecord::Migration[5.1]
  def change
    add_column :lists, :public, :boolean, default: true
  end
end
