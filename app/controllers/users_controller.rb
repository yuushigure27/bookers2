class UsersController < ApplicationController
  
  def new
    @user = current_user
    @books = Book.all
  end
  

  def create
    book = Book.new(book_params)
    book.save
    redirect_to '/books'
  end
  
  def book_params
  params.require(:book).permit(:title, :option)
  end
  
  def edit
  user = User.find(params[:id])
  unless user.id == current_user.id
    redirect_to new_user_session_path
  end
  @user = User.find(params[:id])
  end
  
  
  def show
  @user = User.find(params[:id])
  @books = @user.books
  @book = Book.new
  end
  
  
  def index
   @book = Book.new
   @books = Book.all
   @users = User.all
   @user = current_user
  end
  

  
  def update
    user = User.find(params[:id])
  unless user.id == current_user.id
    redirect_to new_user_session_path
  end
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

private

  def user_params
  params.require(:user).permit(:name, :profile_image, :introduction)
  end

end

