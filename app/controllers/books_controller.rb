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
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to books_path(@book.id)
    else 
      flash[:alret] = "You have updated user successfully."
      render book_path
    end
  end
  
  def update
    @book = Book.find(params[:id])
    
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
     redirect_to book_path(@book.id)
    else
      flash[:alret] = "You have updated book successfully."
      render book_path
    end
  end
  
  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
