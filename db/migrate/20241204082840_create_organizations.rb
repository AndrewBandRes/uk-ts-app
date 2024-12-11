class CreateOrganizations < ActiveRecord::Migration[7.0]
  def change
    create_table :organizations do |t|
      t.string :title
      t.timestamp :deleted_at

      t.timestamps
    end
  end
end
