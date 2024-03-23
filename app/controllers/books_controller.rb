class BooksController < ApplicationController
  def new
    @user = current_user
    @books = Book.all
  end
  
  # 投稿データの保存
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book.id)
    else
      @new_book = Book.new
      @books = Book.all
      @users = User.all
      @user = current_user
      render :index
    end
  end
  
  def about
  # アクションの処理を記述
  end
  
  def index
   @book = Book.new
   @books = Book.all
   @users = User.all
   @user = current_user
  end

  def show
    @new_book = Book.new
    @book = Book.find(params[:id])
    @user = @book.user
  end
  
  def edit
    book = Book.find(params[:id])
  unless book.user.id == current_user.id
    redirect_to books_path
  end
  @book = Book.find(params[:id])
  
  end
  
  def destroy
  @book = Book.find(params[:id])
  @book.destroy
  redirect_to books_path
  end
  
  def update
    @book = Book.find(params[:id])
  unless @book.user.id == current_user.id
    redirect_to new_user_session_path
  end
    if @book.update(book_params)
      redirect_to @book, notice: 'You have updated book successfully.'
    else
      render :edit
    end
  end
  
private
  
  def book_params
  params.require(:book).permit(:title, :body, :image)
  end


end
