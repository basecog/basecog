module Authentication
  extend ActiveSupport::Concern

  included do
    before_action :set_current_user
    before_action :authenticate_user!

    helper_method :user_signed_in?
  end

  private

  def set_current_user
    Current.user = User.find_by(id: cookies.encrypted[:user_session])
  end

  def authenticate_user!
    redirect_to login_path unless user_signed_in?
  end

  def user_signed_in?
    Current.user.present?
  end
end
