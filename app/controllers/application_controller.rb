class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :current_topic

  def current_topic
    @current_topic ||= Topic.find_by(id: params[:id]) if params[:id]
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  #preserving if we ever want to run with a custom error page
  # def render_404
  #   render :file => "#{Rails.root}/public/404", :layout => false, :status => :not_found
  # end



end
