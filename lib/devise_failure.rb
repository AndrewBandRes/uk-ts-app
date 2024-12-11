class DeviseFailure < Devise::FailureApp
  def respond
    if request.controller_class.to_s.start_with? 'VersionedApi::'
      json_api_error_response
    else
      super
    end
  end

  def json_api_error_response
    self.status        = 200
    self.content_type  = 'application/json'
    self.response_body = { error: i18n_message }.to_json
  end
end
