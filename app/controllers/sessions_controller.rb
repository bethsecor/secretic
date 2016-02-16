class SessionsController < ApplicationController
  def create
    user = User.find_or_create_by_auth(request.env["omniauth.auth"])

    if user
      # if we have a user (if the login was successful) redirect to dashboard_path
      session[:user_id] = user.id
      redirect_to dashboard_path
    else
      # if login was not successful, redirect to root_path
      redirect_to root_path
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
