class CreateTools < ActiveRecord::Migration[7.0]
  def change
    create_table :tools do |t|
      t.references :category, foreign_key: true
      t.string :title
      t.timestamp :deleted_at

      t.timestamps
    end
  end
end
