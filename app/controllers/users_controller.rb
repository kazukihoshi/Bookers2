class UsersController < ApplicationController

  def show
    @user_new = User.new
    @user = User.find(params[:id])
    @book_new = Book.new
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
    @books = Book.all
    @book = @user.books
    if @user == current_user
    else
      redirect_to user_path(current_user)
    end 
    
  end
  
  def index
    @user = current_user
    @users = User.all
    @books =Book.all
    @book = Book.new
    @user_new = User.new
  end
  
  def create
    @user = User.new(book_params)
    @book = @user.book
    @book.user_id = current_user_id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book.id)
    else 
      render :index
    end
    
    
  end

  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(current_user)
    else 
      render :edit
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name,:introduction,:profile_image)
  end
  
  
end


