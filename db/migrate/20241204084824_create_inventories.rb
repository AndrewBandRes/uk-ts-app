class CreateInventories < ActiveRecord::Migration[7.0]
  def change
    create_table :inventories do |t|
      t.references :user, type: :uuid, foreign_key: true
      t.references :period, foreign_key: true
      t.references :site, foreign_key: true
      t.references :tool, foreign_key: true
      t.integer :opening_stock
      t.integer :current_stock
      t.timestamp :deleted_at

      t.timestamps
    end
  end
end
