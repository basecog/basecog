class FeatureFlagsController < ApplicationController
  before_action :set_project
  before_action :set_feature_flag, only: %i[ show edit update destroy ]

  def index
    @feature_flags = @project.feature_flags.all
  end

  def show; end

  def new
    @feature_flag = @project.feature_flags.new
  end

  def edit; end

  def create
    @feature_flag = @project.feature_flags.new(feature_flag_params)

    if @feature_flag.save
      redirect_to project_feature_flag_url(@project, @feature_flag)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @feature_flag.update(feature_flag_params)
      redirect_to project_feature_flag_url(@project, @feature_flag)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @feature_flag.destroy!
    redirect_to project_feature_flags_url(@project), notice: "Feature flag was successfully deleted"
  end

  private

  def set_project
    @project = Current.user.projects.find(params[:project_id])
  end

  def set_feature_flag
    @feature_flag = @project.feature_flags.find(params[:id])
  end

  def feature_flag_params
    params.require(:feature_flag).permit(:key, :description, :project_id)
  end
end
