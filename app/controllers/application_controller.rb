class ApplicationController < ActionController::Base
  protect_from_forgery

  def index
    if user_signed_in?
      if current_user.projects.empty?
        current_user.projects << Project.first
        current_user.save
      end
      session[:project_id] = current_user.projects.first

      if request.referer.to_s.ends_with? 'users/sign_in'
        redirect_to '/artifacts'
        return
      end
    end

    respond_to do |format|
      format.html # index.html.erb
    end
  end
end
