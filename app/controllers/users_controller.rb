class UsersController < ApplicationController

  def top
  end

  def edit
   @user = current_user
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      redirect_to user_path
    else
      render :edit
    end
  end

  def show
    @book_new = Book.new
    @user = User.find(params[:id])
    @books = @user.books
    flash[:notice] = "You have updated user successfull"
  end

  def index
    @user = current_user
    @book = Book.new
    @users = User.all
    flash[:notice]
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction)
  end

end
