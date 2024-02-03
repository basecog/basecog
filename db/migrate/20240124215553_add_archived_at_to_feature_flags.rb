class AddArchivedAtToFeatureFlags < ActiveRecord::Migration[7.1]
  def change
    add_column :feature_flags, :archived_at, :datetime
  end
end
