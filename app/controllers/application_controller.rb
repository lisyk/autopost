class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  around_filter :user_time_zome, if: :current_user

  private

  def user_time_zome(&block)
    Time.use_zone(current_user.time_zone, &block)
  end
end
