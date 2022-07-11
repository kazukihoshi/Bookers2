class BooksController < ApplicationController
  def index
    @books = Book.all
    @user = current_user
    @book = Book.new
  end

  def show
    @books = Book.all
    @user = current_user
  end

  def edit
    @book = Book.find(params[:id])
    @user = current_user
  end
  
  def new
    @book = Book.new
  end
  
  def create
    @book = Book.new(book_params)
    @book.user = current_user
    @book.save
    redirect_to book_path(@book.id)
  end
  
  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)
    
  end
  
  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
