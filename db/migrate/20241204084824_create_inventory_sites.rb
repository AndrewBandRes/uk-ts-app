class CreateInventorySites < ActiveRecord::Migration[7.0]
  def change
    create_table :inventory_sites do |t|
      t.references :inventory, foreign_key: true
      t.references :site, foreign_key: true
      t.references :period, foreign_key: true
      t.references :user, type: :uuid, foreign_key: true
      t.integer :amount
      t.timestamp :deleted_at

      t.timestamps
    end
  end
end
