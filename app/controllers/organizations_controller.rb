class OrganizationsController < ApplicationController
  def show
    @organization = current_user.organization
    @projects = current_user.projects
  end
end
