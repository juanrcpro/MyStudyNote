class DropTaskXCategories < ActiveRecord::Migration[7.0]
  def up
    drop_table :user_xnotebooks
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
