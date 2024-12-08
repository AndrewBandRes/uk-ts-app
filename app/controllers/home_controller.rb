class HomeController < ApplicationController
  def index
    if user_signed_in?
      redirect_to user_root_url
    end
  end
end
