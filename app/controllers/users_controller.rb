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
      respond_to do |format|
        format.html { render :new }
        format.js   { render_error_messages }
      end
    end
  end

  private

  def render_error_messages
    render json: @user.errors, status: :unprocessable_entity
  end

  def permitted_params
    params.require(:user).permit(:nickname, :password, :password_confirmation)
  end
end
