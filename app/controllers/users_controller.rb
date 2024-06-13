class UsersController < ApplicationController
  def show
    @user_self = User.find(current_user.id)
    @user_selfothers = User.find(params[:id])
    @book = Book.new
  end
  
  def index
    @user = User.find(current_user.id)
    @users = User.all
    @book = Book.new
  end

  def edit
    @user = User.find(current_user.id)
  end
  
  def update
    user = User.find(current_user.id)
    if user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(current_user.id)
    else
      render :edit
    end
  end

  private
  
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
