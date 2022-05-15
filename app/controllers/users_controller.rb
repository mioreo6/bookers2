class UsersController < ApplicationController
  def show
    @user = current_user
    @book = Book.new
    @books = Book.all
    @bok = User.find(params[:id])

  end

  def edit
    @user = User.find(params[:id])
  end

  def index
   @users = User.all
   @user = current_user
   @book = Book.new
  end

 def update
   @user = User.find(params[:id])
   @user.update(user_params)
   redirect_to user_path(@user)
 end
  private
  def user_params
    params.require(:user).permit(:name, :introduction, :image)
  end
end
