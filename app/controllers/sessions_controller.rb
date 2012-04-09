class SessionsController < ApplicationController
  def authenticate_admin
    auth_hash = request.env['omniauth.auth']

    session[:admin_user] = auth_hash['info']['email']

    if admin?
      redirect_to '/'
    else
      render :text => '401 Unauthorized', :status => 401
    end
  end

  def admin_authentication_failure
    flash[:notice] = "You have declined to sign in with your Google account. You are not logged in."
    redirect_to '/'
  end

  def logout_admin
    session[:admin_user] = nil
    redirect_to '/', :notice => "Signed out!"
  end
end
