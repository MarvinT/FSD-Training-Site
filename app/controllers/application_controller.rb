class ApplicationController < ActionController::Base
  protect_from_forgery

  if Rails.env.test?
    prepend_before_filter :stub_current_user
    def stub_current_user
      session[:admin_user] = "test user"
    end
  end

  def admin?
    session[:admin_user]
    # if I want to have a list of admins,use this
    #session[:admin_user] && (ENV['ADMINS'] || "").split(',').include?(session[:admin_user])
  end
  helper_method :admin?

  def admin_required
    redirect_to '/auth/admin' unless admin?
  end
end
