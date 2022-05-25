class UsersController < ApplicationController

  before_action :correct_user, only: [:edit, :update]

  def top
  end

  def edit
   @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfull"
      redirect_to user_path(@user)
    else

      render "edit"
    end
  end

  def show
    @book_new = Book.new
    @user = User.find(params[:id])
    @books = @user.books
  end

  def index
    @user = current_user
    @book = Book.new
    @users = User.all
    flash[:notice]
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :image)
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(edit_user_path) unless @user == current_user
  end

end
