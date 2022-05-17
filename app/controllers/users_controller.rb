class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:top]
  before_action :correct_user, only:[:edit]

  def show
    @user = current_user
    @book = Book.new
    @bok = User.find(params[:id])
    @books = @bok.books


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
   if @user.update(user_params)
    flash[:success] = 'You have updated user successfully.'
    redirect_to user_path(current_user)
   else
    render :edit
   end
 end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(user_path(current_user)) unless @user == current_user
  end
end
