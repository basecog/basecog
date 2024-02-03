class Api::V0::ApplicationController < ApplicationController
  protect_from_forgery with: :null_session

  skip_before_action :authenticate
  before_action :set_environment

  private

  def set_environment
    bearer_token = extract_bearer_token(request.headers["Authorization"])

    if api_key = ApiKey.find_by(value: bearer_token)
      @environment = api_key.environment
    else
      render json: { message: "Invalid API key" }, status: :unauthorized
    end
  end

  def extract_bearer_token(authorization_header)
    authorization_header&.match(/^Bearer /) ? authorization_header.sub(/^Bearer /, "") : nil
  end
end
