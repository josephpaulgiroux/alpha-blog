class UsersController < ApplicationController


  before_action :set_user, only: [:show, :edit, :update, :destroy]
  
  def new
    @user = User.new
  end 

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice]  = "Welcome, #{@user.username}, your account has been created."
      # :notice or :alert (when something goes wrong)
      redirect_to articles_path
    else 
      render 'new'
    end
  end 
  
  def edit
  end 
  
  def show
    @articles = @user.articles
  end 
  
  def update
    if @user.update(user_params)
      flash[:notice] = "Your profile details were successfully updated."
      redirect_to articles_path
    else 
      render 'edit'    
    end 
  end 
  
  def destroy
  end 
  
  private 
  
  
  def set_user
    @user = User.find(params[:id])
  end 
  
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end 
  
end
