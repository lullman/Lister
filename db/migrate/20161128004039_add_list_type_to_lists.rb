class AddListTypeToLists < ActiveRecord::Migration[5.1]
  def change
    add_column :lists, :list_type, :string
  end
end
