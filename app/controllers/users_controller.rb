class UsersController < ApplicationController
  before_action :user_signed_in?

  def index
    @response_body = JSON.parse HTTP.headers(Authorization: session['Authorization']).get(ENV['API_URL'] + '/users').body
  end

  def user_signed_in?
    if session['Authorization'].blank?
      flash[:alert] = "To access this page, you have to login first"
      redirect_to login_sessions_path
    end
  end
end
