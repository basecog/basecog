class CreateApiKeys < ActiveRecord::Migration[7.1]
  def change
    create_table :api_keys do |t|
      t.string :name
      t.text :description
      t.string :key, null: false
      t.references :environment, null: false, foreign_key: true

      t.timestamps
    end

    add_index :api_keys, [ :key ], unique: true
    add_index :api_keys, [ :environment_id, :name ], unique: true
  end
end
