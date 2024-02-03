class TreatmentsController < ApplicationController
  before_action :set_project, :set_feature_flag, :set_environment

  def create_or_update
    treatment = Treatment.find_or_create_by(feature_flag: @feature_flag, environment: @environment)
    treatment.update(enabled: treatment_params[:enabled]) ? notice = "Treatment was successfully updated" : alert = "An error occurred"
    redirect_to project_feature_flag_path(@project, @feature_flag), allow_other_host: false, notice:, alert:
  end

  private

  def set_project
    @project = Current.user.projects.find(params[:project_id])
  end

  def set_feature_flag
    @feature_flag = @project.feature_flags.find(treatment_params[:feature_flag_id])
  end

  def set_environment
    @environment = @project.environments.find(treatment_params[:environment_id])
  end

  def treatment_params
    params.require(:treatment).permit(:enabled, :feature_flag_id, :environment_id)
  end
end
