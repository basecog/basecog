class ProjectsController < ApplicationController
  before_action :set_project, only: %i[ show update destroy settings ]

  def index
    @projects = Current.user.projects.all.order(name: :asc)
  end

  def show
    redirect_to project_feature_flags_path(@project)
  end

  def new
    @project = Current.account.projects.new
  end

  def create
    @project = Current.account.projects.new(project_params)

    if @project.save
      redirect_to project_url(@project)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @project.update(project_params)
      redirect_to project_settings_path(@project), notice: "Project was successfully updated"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @project.destroy!
    redirect_to projects_url, notice: "Project was successfully deleted"
  rescue ActiveRecord::DeleteRestrictionError
    redirect_back_or_to projects_url,
                        allow_other_host: false,
                        alert: "Please delete all feature flags and environments before deleting the project"
  end

  def settings; end

  private

  def set_project
    @project = Current.account.projects.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :description)
  end
end
