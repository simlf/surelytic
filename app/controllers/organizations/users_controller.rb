class Organizations::UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = current_user.organization.users.new(user_params)
    @user.organization = current_user.organization

    if @user.save
      redirect_to organization_path
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
