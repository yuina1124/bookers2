class BooksController < ApplicationController
  def edit
  end

  def index
    @book = Book.new
  end

  def show
  end

  def create
    book = Book.new(book_params)
    book.save
    redirect_to book_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
