class Api::V0::DecisionController < Api::V0::ApplicationController
  before_action :set_project

  def create
    feature_flag = @project.feature_flags.find_by(key: params[:key])
    render_unprocessable_entity("Feature flag not found") and return if feature_flag.nil?

    treatment = Treatment.find_by(feature_flag:, environment: @environment)
    enabled = treatment&.enabled || false
    render json: { enabled: }, status: :ok
  end

  private

  def set_project
    @project = @environment.project
  end

  def render_unprocessable_entity(message)
    render json: { error: message }, status: :unprocessable_entity
  end
end
