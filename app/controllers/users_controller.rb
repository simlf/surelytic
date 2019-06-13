class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = current_user.organization.users.new(user_params)
    @user.organization = current_user.organization

    if @user.save
      redirect_to organization_path(@organization)
    else
      render new
    end
  end

  private

  def user_params
    params.require(:organization).permit(:email, :password)
  end

end
