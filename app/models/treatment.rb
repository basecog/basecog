class Treatment < ApplicationRecord
  belongs_to :feature_flag
  belongs_to :environment

  validate :feature_flag_and_environment_belong_to_same_project

  private

  def feature_flag_and_environment_belong_to_same_project
    unless feature_flag.project_id == environment.project_id
      errors.add :base, "Feature flag and environment must belong to the same project"
    end
  end
end
