class BooksController < ApplicationController
  def show
  end

  def index
    @book = Book.new
    @books = Book.all
    @user = User.find(current_user.id)
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :profile_image)
  end

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
