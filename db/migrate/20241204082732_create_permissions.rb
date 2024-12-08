class CreatePermissions < ActiveRecord::Migration[7.0]
  def change
    create_table :permissions do |t|
      t.references :user, foreign_key: true, type: :uuid
      t.string :role
      t.bigint :context_id
      t.string :context_type

      t.timestamps
    end
  end
end
