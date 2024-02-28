class BooksController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]


def index
   @book = Book.new
  @books = Book.all
  @users = @books
  @user = current_user
  @errors = flash.now[:error]
end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book)
    else
      @books = Book.all
      @users = @books
      @user = current_user
      render :index
    end
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @users = User.all
  end

  def edit
    @book = Book.find(params[:id])
  end

def update
    @book = Book.find(params[:id])
if @book.update(book_params)
     flash[:notice] = "You have updated book successfully."
     redirect_to book_path(@book.id)
else
   flash.now[:error] = @book.errors.full_messages
   render :edit
end
end


def destroy
book = Book.find(params[:id])
book.destroy
redirect_to books_path
end


  private

  def book_params
    params.require(:book).permit(:title, :body, :image)
  end

def is_matching_login_user
  book = Book.find(params[:id])
  unless book.user.id == current_user.id
   redirect_to books_path

  end
end
end