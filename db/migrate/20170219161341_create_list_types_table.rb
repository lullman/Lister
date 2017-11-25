class CreateListTypesTable < ActiveRecord::Migration[5.1]
  def change
    create_table :list_types do |t|
      t.string :list_type
    end
  end
end
