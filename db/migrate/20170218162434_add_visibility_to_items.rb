class AddVisibilityToItems < ActiveRecord::Migration
  def change
    add_column :items, :visibility, :string, default: 'everyone'
  end
end
