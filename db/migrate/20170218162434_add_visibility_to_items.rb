class AddVisibilityToItems < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :visibility, :string, default: 'everyone'
  end
end
