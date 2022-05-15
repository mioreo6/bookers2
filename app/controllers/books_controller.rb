class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book)
    else
      @book = Book.find(params[:id])
      render :edit
    end
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
    redirect_to books_path
    else
       @user = current_user
       @books = Book.all
       @book = Book.new
      render :index
    end
  end

  def index
    @user = current_user
    @books = Book.all
    @book = Book.new

  end

  def show
    @user = current_user
    @users = User.find(params[:id])
    @book = Book.new
    @books = Book.find(params[:id])
    @bok = @books.user


  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end

  private
    def book_params
      params.require(:book).permit(:title, :body)
    end
end
