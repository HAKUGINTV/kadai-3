class UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]


def index
  @users = User.all
  @user = current_user
end

  def show
     @user = User.find(params[:id])
    @books = @user.books
    @users = User.all


  end

  def edit
  @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    # 他の処理...
  end

def update
    @user = User.find(params[:id])
if @user.update(user_params)
     flash[:notice] = "You have updated book successfully."
     redirect_to user_path(@user.id)
else
   render :edit
end
end


  private

  def user_params
    params.require(:user).permit(:profile_image, :introduction, :name)
  end
def is_matching_login_user
  user = User.find(params[:id])
  unless user.id == current_user.id
   redirect_to user_path(current_user)

  end
end
end