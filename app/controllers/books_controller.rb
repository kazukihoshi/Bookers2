class BooksController < ApplicationController
  before_action :corrent_user, only: [:edit, :update]
  
  def index
    @books = Book.all
    @user = current_user
    @book_new = Book.new
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @book_new = Book.new
  end

  def edit
    @book = Book.find(params[:id])
    @user = current_user
  end
  
  def new
    @book = Book.new
  end
  
  def create
    @book_new = Book.new(book_params)
    @book_new.user_id = current_user.id
    @user = current_user
    @books = Book.all
    if @book_new.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book_new.id)
    else 
      render :index
    end
  end
  
  def update
    @book = Book.find(params[:id])
    @user = current_user
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end
  
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end
  
  private
  
  def book_params
    params.require(:book).permit(:title, :body,)
  end
  
  def corrent_user
    @book = Book.find(params[:id])
    @user = @book.user
    redirect_to books_path unless @user == current_user 
  end
  
end
