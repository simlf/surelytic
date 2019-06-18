class ProjectsController < ApplicationController
  def show
    @project = Project.includes(tests: :results).find(params[:id])

    tests = @project.tests.group_by do |test|
      result = test.results.sort_by(&:created_at).reverse.first

      if result
        result.correct ? :correct : :incorrect
      else
        :no_results_yet
      end
    end

    @incorrect_tests = tests[:incorrect]
    @correct_tests = tests[:correct]
    @no_results_tests = tests[:no_results_yet]
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
