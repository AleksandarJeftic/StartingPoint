class CreatePermissions < ActiveRecord::Migration[6.1]
  def change
    create_table :permissions do |t|
      t.integer :code
      t.text :description
      t.references :user, foreign_key: true, index: true, null: false

      t.timestamps
    end
  end
end
