class OrganizationsController < ApplicationController
  def show
    @organization = current_user.organization
    @users = current_user.organization.users
    @projects = current_user.projects

    @chart_data_labels = []
    @chart_data_incorrect = []

    @projects.each do |project|
      incorrect_val = 0
      @chart_data_labels.push(project.name)
      project.tests.each do |test|
        incorrect_val += test.results.last.number_incorrect_values unless test.results.last.nil?
      end
      @chart_data_incorrect.push(incorrect_val)
    end
  end
end
