class CreateProjects < ActiveRecord::Migration[7.1]
  def change
    create_table :projects do |t|
      t.string :name, null: false
      t.text :description
      t.references :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
