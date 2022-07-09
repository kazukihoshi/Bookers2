class UsersController < ApplicationController
  def show
    @user = current_user
    @books = Book.all
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
    redirect_to
  end
  
  def index
    @user = current_user
    @books =Book.all
  end
  
  def create
    @user = User.new(book_params)
    @book.user = current_user
    @book.save
    redirect_to book_path(@book.id)
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name,:introduction,:profile_image)
  end
end


