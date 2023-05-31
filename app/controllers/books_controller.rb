class BooksController < ApplicationController
  def new
    @book = Book.new
   @books = Book.all

  end

  def index
    @book = Book.new
    @books = Book.all


  end
  def create
    # # １.&2. データを受け取り新規登録するためのインスタンス作成
    # book = Book.new(book_params)
    # # 3. データをデータベースに保存するためのsaveメソッド実行
    # book.save
    # # 4. トップ画面へリダイレクト
    # redirect_to '/books'
      @book = Book.new(book_params)
    if @book.save
       flash[:notice] = "Book was successfully created."
      redirect_to show_book_path(@book.id)
    else
      @books = Book.all
      render :index
    end


  end

  def show
      @book = Book.find(params[:id])
      @books = Book.new

  end

  def edit
       @book = Book.find(params[:id])
      @books = Book.all
  end
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end

  def update
    @book = Book.find(params[:id])
   if  @book.update(book_params)
    flash[:notice] = "Book was successfully created."
    redirect_to book_path(@book.id)
   else
        # 保存に失敗したとき
    flash[:alert] = "errors prohibited this book from being saved:"
    @books = Book.all
    render :books_path
   end
  end
  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end


end
