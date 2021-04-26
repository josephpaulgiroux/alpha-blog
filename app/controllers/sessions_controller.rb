class SessionsController < ApplicationController
  
  def new
  end 
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:notice] = "You have logged in successfully."
      redirect_to user
    else 
      flash.now[:alert] = "That email and password combination was not valid."
      render 'new'
    end 
  end 
  
  def destroy
    if session[:user_id]
      session[:user_id] = nil
      flash[:notice] = "You have logged out"
    end
    redirect_to root_path
  end
  
end