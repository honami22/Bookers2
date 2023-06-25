class UsersController < ApplicationController
  # before_action :correct_user, only: [:update]
  before_action :is_matching_login_user ,only: [:updete, :edit]
  def show
    @user = User.find(params[:id])
    @books = Book.where(user_id: @user.id)
    @book_new = Book.new


  end

  def edit
    @user = User.find(params[:id])
  end

  def index
    @user = current_user
    @users = User.all
    @book_new = Book.new



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
  def user_params
    params.require(:user).permit(:name,:introduction,:profile_image)
  end

  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path(current_user.id)
    end
  end

end

