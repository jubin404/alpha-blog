class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update]
  before_action :require_user, only: [:edit, :update]
  before_action :require_same_user, only: [:edit, :update]

  def show
    @articles = @user.articles  
  end

  def index 
    @users = User.all
  end

  def new
    @user = User.new
  end  

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "Your account was successfully updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def create 
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = "Welcome to Alpha Blog #{@user.username}, you have successfulyy logged in"
      redirect_to articles_path
    else
      render 'new'
    end
  end

  private 

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def require_same_user
    if current_user != @article.user
      flash[:alert] = "You can only edit your own account"
      redirect_to @user
    end
  end
end
