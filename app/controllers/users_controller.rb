class UsersController < ApplicationController
  def show
    @user = current_user
    @books = Book.all
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
    
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
    @user = login(params[:name], params[:password])
    if @user
      redirect_back_or_to root_path, success: t('.create.success')
    else
      flash.now[:danger] = t('.create.fail')
      render :new
    end
  end
  
  def update
    @user = User.all
    @user.update(user_params)
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path
    else 
      flash[:alret] = "You have updated user successfully."
      render books_path
    end
    
    
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name,:introduction,:profile_image)
  end
end


