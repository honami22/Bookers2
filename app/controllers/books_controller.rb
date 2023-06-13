class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end

  def create
    @book = Book.new

    @book.save
    redirect_to new_book_path(@book.id)
  end

  def index
    @books = Book.all
    @user = @books
  end

  def show
    @book = Book.find(params[:id])
    @user = @book
  end

  def edit
    @book = Book.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:books).permit(:title, :body, :user_id)
  end
end