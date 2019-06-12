class ProjectsController < ApplicationController
  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
  end

  def create
    @project = current_user.projects.new(project_params)
    @project.organization = current_user.organization

    @project.save
    redirect_to project_path(@project)
  end

  private

  def project_params
    params.require(:project).permit(:name)
  end
end
