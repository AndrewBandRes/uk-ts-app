class CreateAffiliations < ActiveRecord::Migration[7.0]
  def change
    create_table :affiliations do |t|
      t.references :organization, foreign_key: true
      t.string :title
      t.timestamp :deleted_at

      t.timestamps
    end
  end
end
