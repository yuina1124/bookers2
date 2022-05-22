class UsersController < ApplicationController

  def top
  end

  def edit
   @user = current_user
  end

  def create
   @user = User.new(user_params)
   @user.id = current_user.id
   @user.save
 end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(user.id)
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
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction)
  end

end
