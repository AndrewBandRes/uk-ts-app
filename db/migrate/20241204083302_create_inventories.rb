class CreateInventories < ActiveRecord::Migration[7.0]
  def change
    create_table :inventories do |t|
      t.references :category, foreign_key: true
      t.string :title
      t.timestamp :deleted_at

      t.timestamps
    end
  end
end
