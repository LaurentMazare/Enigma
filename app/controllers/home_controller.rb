class HomeController < ApplicationController
  def index
  end

  def login
    user = User.find_by_login(params[:login])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url, :notice => "You are logged in!"
    else
      redirect_to root_url, :notice => "Incorrect login or password"
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end
end
