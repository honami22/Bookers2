class BooksController < ApplicationController
before_action :correct_user,   only: [:edit, :update, :destroy]
  def new
     @book = Book.new
    @books = Book.all
    @user = @books
  end

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end

   # 投稿データの保存
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id)
  end


  def index
    @book_new = Book.new
    @books = Book.all

  end

  def show
   @book_new = Book.new
   @books = Book.all
   @book = Book.find(params[:id])

  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
   if  @book.update(book_params)
    flash[:notice] = "Book was successfully created."
    redirect_to book_path(@book.id)
   else
        # 保存に失敗したとき
    flash[:alert] = "errors prohibited this book from being saved:"
    @books = Books.all
    render :edit_book_path
   end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.user_id = current_user.id
    @book.destroy
    redirect_to books_path
  end

    def correct_user
      @book = Book.find(params[:id])
      redirect_to(books_path) unless current_user?(@book.user)
    end

    def current_user?(user)
      user == current_user
    end

  private

  def book_params
    params.require(:book).permit(:title, :body)

  end
end