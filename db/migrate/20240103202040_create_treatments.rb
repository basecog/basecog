class CreateTreatments < ActiveRecord::Migration[7.1]
  def change
    create_table :treatments do |t|
      t.references :environment, null: false, foreign_key: true
      t.references :feature_flag, null: false, foreign_key: true
      t.boolean :enabled, null: false, default: false

      t.timestamps
    end

    add_index :treatments, [ :feature_flag_id, :environment_id ], unique: true
  end
end
