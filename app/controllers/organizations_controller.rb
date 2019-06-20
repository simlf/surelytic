class OrganizationsController < ApplicationController
  def show
    @organization = current_user.organization
    @users = current_user.organization.users
    @projects = current_user.projects
  end
end
