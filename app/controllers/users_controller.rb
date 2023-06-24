class UsersController < ApplicationController
  # before_action :correct_user, only: [:update]
  def show
    @user = User.find(params[:id])
    @books = Book.where(user_id: @user.id)
    @book = Book.new

  end

  def edit
    @user = User.find(params[:id])

  end

  def index
    @user = current_user
    @users = User.all

  end
  def create
    @user = User.new(user_params)
    @uer.user_id = current_user.id
    @user.save
    redirect_to users_path(@user.id)
  end




  def update
   @user = User.find(params[:id])
    if  @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      @user.save
     redirect_to user_path(@user.id)
    else
      @users=User.all
      render :edit

    end

  end

  private

  def correct_user
    @user = User.find(params[:id])
    if current_user != @user
      redirect_to user_path(current_user.id)
    end
  end
  def user_params
    params.require(:user).permit(:name,:introduction,:profile_image)
  end

end

