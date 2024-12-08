class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.references :affiliation, foreign_key: true
      t.string :title
      t.timestamp :deleted_at

      t.timestamps
    end
  end
end
