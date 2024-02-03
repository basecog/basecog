class SessionsController < ApplicationController
  skip_before_action :authenticate, only: %i[ new create ]

  def new
    redirect_to root_path if Current.user
  end

  def create
    if user = User.authenticate_by(user_params)
      cookies.encrypted[:user_session] = { value: user.id, expires: 2.weeks.from_now }
      redirect_to root_path
    else
      flash.now[:alert] = "Incorrect email or password"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    cookies.delete :user_session
    redirect_to login_path
  end

  private

  def user_params
    params.permit(:email, :password)
  end
end
