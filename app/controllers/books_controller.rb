class BooksController < ApplicationController
# before_action :correct_user,   only: [:edit, :update, :destroy]
  before_action :is_matching_login_user ,only: [:updete, :edit]
  def new
    @book = Book.new
    @books = Book.all
    @user = @books
  end

   # 投稿データの保存
  def create
    @book_new = Book.new(book_params)
    @book_new.user_id = current_user.id
    if @book_new.save
      flash[:notice]= "Book was successfully created."
      redirect_to book_path(@book_new.id)
    else
     @user =@book_new.user
     @books = Book.all
     render template: "users/show"

    end
  end


  def index
    @book_new = Book.new
    @books = Book.all
    @user = current_user

  end


  def show
     @book_new  = Book.new
     @book = Book.find(params[:id])
     @user = @book.user
  end

  def edit
     @book = Book.find(params[:id])
    # @user = current_user
     @book_new=Book.new

  end

  def update
     @book = Book.find(params[:id])
   if @book.update(book_params)
      flash[:notice] = "Book was successfully updated."
      redirect_to book_path(@book.id)
   else
        # 保存に失敗したとき
      @books = Book.all
      render :edit
   end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.user_id = current_user.id
    @book.destroy
    redirect_to books_path
  end

  # def correct_user
  #   @book = Book.find(params[:id])
  #   redirect_to(books_path) unless current_user?(@book.user)
  # end

  # def current_user?(user)
  #     user == current_user
  # end

  private

  def book_params
    params.require(:book).permit(:title, :body,:profile_image)

  end

  def is_matching_login_user
     user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to books_path 
    end
  end





end