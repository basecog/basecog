class ApiKeysController < ApplicationController
  before_action :set_project, :set_environment
  before_action :set_api_key, only: %i[ show destroy ]

  def show; end

  def new
    @api_key = @environment.api_keys.new
  end

  def create
    @api_key = @environment.api_keys.new(api_key_params)

    if @api_key.save
      redirect_to [ @project, @environment, @api_key ]
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @api_key.destroy!
    redirect_to project_environment_url(@project, @environment), notice: "API key was successfully deleted"
  end

  private

  def set_project
    @project = Current.user.projects.find(params[:project_id])
  end

  def set_environment
    @environment = @project.environments.find(params[:environment_id])
  end

  def set_api_key
    @api_key = @environment.api_keys.find(params[:id])
  end

  def api_key_params
    params.require(:api_key).permit(:name, :description)
  end
end
