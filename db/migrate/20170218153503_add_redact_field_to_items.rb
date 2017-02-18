class AddRedactFieldToItems < ActiveRecord::Migration
  def change
    add_column :items, :redacted, :boolean, default: false
  end
end
