class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @book = @user.book
  end

  def edit
    @user = User.find(params[:id])
    
  end
  
  def index
    @user = current_user
    @users = User.all
    @books =Book.all
  end
  
  def create
    @user = User.new(book_params)
    @book = Book.new(book_params)
    @book.user_id = current_user_id
    @book.save
    redirect_to book_path(@book.id)
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


