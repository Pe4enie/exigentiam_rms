class ApplicationController < ActionController::Base
  protect_from_forgery

  def index
    session[:project_id] = user_signed_in? ? current_user.projects.first : nil

    respond_to do |format|
      format.html # index.html.erb
    end
  end
end
