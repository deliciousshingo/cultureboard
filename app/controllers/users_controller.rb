class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def show
    @user = User.find(params[:id])
    @boards = @user.boards
  end

  def edit
  end

  def update
    if @user.update(user_params)
      bypass_sign_in(@user)
      redirect_to user_path(@user.id)
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end
end