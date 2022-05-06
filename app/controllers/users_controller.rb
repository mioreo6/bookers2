class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
  end

  def index
   @user = User.all

  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :image)
  end
end
