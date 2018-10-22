class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by_nickname(params[:nickname])

    if user.try(:authenticate, params[:password])
      session[:user_id] = user.id
      redirect_to root_url, notice: "Welcome back #{user.nickname}"
    else
      flash.now[:alert] = 'Invalid nickname or password'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: 'Logged out'
  end
end
