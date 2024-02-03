class ApplicationController < ActionController::Base
  include Authentication
  include SetCurrentRequestDetails
end
