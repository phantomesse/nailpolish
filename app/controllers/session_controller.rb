class SessionController < ApplicationController
  #add an exception
  skip_before_filter :require_user, :only => [:new, :create]
  
  # Called when click submit on login page
  # get params with email address
  # look up user
  # if user exists with that email address
  def create
    @user = User.first(:email => params[:email].downcase)
    if @user
      session[:user_id] = @user.id
      redirect_to root_path
    else
      redirect_to login_path
    end
  end
  
  # GET request. Will show login page.
  def new
    render '/session/new'
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
