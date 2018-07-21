class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_name(params[:name])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome "+user.name+"!"
      redirect_to '/'
    else
      flash[:danger] = "Incorrent username or password!"
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

end
