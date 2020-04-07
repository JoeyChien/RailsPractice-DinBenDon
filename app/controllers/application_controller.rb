class ApplicationController < ActionController::Base

  before_action :check_login
  
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found  
  
  helper_method :current_user

  private

  def check_login
    redirect_to login_path unless current_user
  end

  def record_not_found
    render file: 'public/404.html',
           status: 404,
           layout: false
  end

  def current_user
    session[:ccc9527] 
  end

end
