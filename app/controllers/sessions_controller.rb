class SessionsController < ApplicationController
  def login
  end

  def login_request
    response = HTTP.post((ENV['API_URL']) +'/auth/login',
      params: login_params.to_h)
    response_body = JSON.parse response.body
    if response.status.success?
      session['Authorization'] = response_body['token']
      redirect_to users_path
    else
      flash['alert'] = response_body
      redirect_to login_sessions_path
    end

  end

  def signin
  end

  def signup_request
    response = HTTP.post((ENV['API_URL']) +'/auth/signup',
      params: signup_params.to_h)
    response_body = JSON.parse response.body
    if response.status.success?
      redirect_to login_sessions_path
    else
      flash['alert'] = response_body
      redirect_to signup_sessions_path
    end
  end

  private

  def login_params
    params.permit(:email, :password)
  end

  def signup_params
    params.permit(
      :first_name, :last_name, :email, :password, :password_confirmation,
      :address, :color, :ratings, :teachings
    )
  end
end
