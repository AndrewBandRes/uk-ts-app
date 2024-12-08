class CreateTransfers < ActiveRecord::Migration[7.0]
  def change
    create_table :transfers do |t|
      t.references :to_site, index: true, foreign_key: { to_table: :inventory_sites }
      t.references :from_site, index: true, foreign_key: { to_table: :inventory_sites }
      t.integer :delta
      t.string :reason
      t.string :note
      t.timestamp :deleted_at

      t.timestamps
    end
  end
end
