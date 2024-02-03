class CreateEnvironments < ActiveRecord::Migration[7.1]
  def change
    create_table :environments do |t|
      t.string :name, null: false
      t.text :description
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
