class UsersController < ApplicationController
  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @events = @user.events
  end

  def create
    @user = User.new(user_params)    
    if @user.save
      flash[:success] = "Welcome to Evently!"
      redirect_to @user #or user_url(@user)
    else
      render 'new'
    end
  end

  private
    
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
