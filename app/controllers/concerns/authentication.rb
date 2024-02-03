module Authentication
  extend ActiveSupport::Concern

  included do
    before_action :set_current_user
    before_action :authenticate
  end

  private

  def set_current_user
    Current.user = User.find_by(id: cookies.encrypted[:user_session])
  end

  def authenticate
    redirect_to login_path unless Current.user
  end
end
