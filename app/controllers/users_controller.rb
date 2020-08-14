class UsersController < ApplicationController

  def show
    authorize @user
    @user = User.friendly.find(params[:id])
  end
end
