class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def authenticate_user!
    redirect_to new_user_registration_path, alert: I18n.t('devise.failure.unauthenticated') if @user.nil?
  end
end
