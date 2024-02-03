class CreateFeatureFlags < ActiveRecord::Migration[7.1]
  def change
    create_table :feature_flags do |t|
      t.string :key, null: false
      t.string :description
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end

    add_index :feature_flags, [ :project_id, :key ], unique: true
  end
end
