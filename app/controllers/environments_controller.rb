class EnvironmentsController < ApplicationController
  before_action :set_project
  before_action :set_environment, only: %i[ show edit update destroy ]

  def index
    @environments = @project.environments.all
  end

  def show; end

  def new
    @environment = @project.environments.new
  end

  def edit; end

  def create
    @environment = @project.environments.new(environment_params)

    if @environment.save
      redirect_to project_environment_url(@project, @environment)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @environment.update(environment_params)
      redirect_to project_environment_url(@project, @environment)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @environment.destroy!
    redirect_to project_environments_url(@project), notice: "Environment was successfully deleted"
  end

  private

  def set_project
    @project = Current.user.projects.find(params[:project_id])
  end

  def set_environment
    @environment = @project.environments.find(params[:id])
  end

  def environment_params
    params.require(:environment).permit(:name, :description, :project_id)
  end
end
