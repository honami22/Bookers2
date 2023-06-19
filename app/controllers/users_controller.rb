class UsersController < ApplicationController
  before_action :correct_user, only: [:update]
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
    # @post_images = @user.post_images
  end

  def edit
    @user = User.find(params[:id])
     @user_new = User.new
  end

  def index
    @user_new = User.new
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
   @user.update!(user_params)
   redirect_to users_path(@user.id)
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

