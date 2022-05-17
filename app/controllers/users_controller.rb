class UsersController < ApplicationController

  def top
  end

  def edit
   @user = current_user
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(user.id)
  end

  def show
    @user = User.find(params[:id])
    @book_new = Book.new
    @book = Book.find(params[:id])
  end

  def index
    @user = current_user
    @book = Book.new
    @users = User.all
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end

end
