class OrganizationsController < ApplicationController
  def show
    @orga = Organization.find(current_user.id)
    @projects = current_user.projects # valide
  end
end
