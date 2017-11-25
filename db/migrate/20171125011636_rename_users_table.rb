class RenameUsersTable < ActiveRecord::Migration[5.1]
  def change
    rename_table :users, :users_old
  end
end
