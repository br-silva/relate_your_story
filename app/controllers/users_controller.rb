class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(permitted_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to root_url, notice: 'Signed up.'
    else
      render :new
    end
  end

  private

  def permitted_params
    params.require(:user).permit(:nickname, :password, :password_confirmation)
  end
end
