class CreatePeriods < ActiveRecord::Migration[7.0]
  def change
    create_table :periods do |t|
      t.references :organization, foreign_key: true
      t.date :started_at
      t.date :closed_at
      t.timestamp :deleted_at
      
      t.timestamps
    end
  end
end
