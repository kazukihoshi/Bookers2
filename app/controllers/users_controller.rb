class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @book = @user.books
    @book_user = current_user
  end

  def edit
    @user = User.find(params[:id])
    
  end
  
  def index
    @user = current_user
    @users = User.all
    @books =Book.all
    @book = Book.new
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
    @user = User.all
    @user.update(user_params)
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to users_path
    else 
      render :edit
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name,:introduction,:profile_image)
  end
end


