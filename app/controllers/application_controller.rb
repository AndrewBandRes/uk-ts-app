class ApplicationController < ActionController::Base
  layout "application"

  helper_method :current_controller?

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { render json: { foo: 'bar' }, status: :forbidden  }
      format.html { redirect_to root_path }
    end
  end

  def current_controller?(names)
    names.include?(controller_path)
  end

  def after_sign_in_path_for(resource)
    user_root_path
  end
end
