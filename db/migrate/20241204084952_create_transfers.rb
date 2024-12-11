class CreateTransfers < ActiveRecord::Migration[7.0]
  def change
    create_table :transfers do |t|
      t.references :from_inventory, index: true, foreign_key: { to_table: :inventories }
      t.references :to_inventory, index: true, foreign_key: { to_table: :inventories }
      t.integer :delta
      t.text :reason
      t.text :note
      t.timestamp :deleted_at

      t.timestamps
    end
  end
end
