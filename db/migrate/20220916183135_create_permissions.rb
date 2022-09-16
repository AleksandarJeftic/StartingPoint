class CreatePermissions < ActiveRecord::Migration[6.1]
  def change
    create_table :permissions do |t|
      t.integer :code
      t.text :description

      t.timestamps
    end
  end
end
