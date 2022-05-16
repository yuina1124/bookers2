class BooksController < ApplicationController
  def edit
  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @book_new = Book.new
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id)
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
