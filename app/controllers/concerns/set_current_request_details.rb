module SetCurrentRequestDetails
  extend ActiveSupport::Concern

  included do
    before_action do
      # Some premature optimization here... Request details aren't used anywhere at the moment,
      # but will certainly be in the future.

      Current.request_id = request.uuid
      Current.user_agent = request.user_agent
      Current.ip_address = request.ip
    end
  end
end
