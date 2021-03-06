class UsersController < ApplicationController
 before_action :baria_user, only: [:edit]

 def index
   @user = current_user
   @users = User.all
   @book = Book.new
 end


 def edit
    @user = User.find(params[:id])
 end

 def update
    @user = User.find(params[:id])
  if  @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
       redirect_to user_path(@user)
   else
      @users = User.all
       render "edit"
   end
 end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
    @today_book = @books.created_today
    @yesterday_book = @books.created_yesterday
    @this_week_book = @books.created_this_week
    @last_week_book = @books.created_last_week
  end

  def follower
   user = User.find(params[:id])
   @users = user.followers
  end

  def followed
   user = User.find(params[:id])
   @users = user.followed
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image,:introduction)
  end

   def baria_user
    unless User.find(params[:id]).id == current_user.id
        redirect_to user_path(current_user)
    end
   end
end