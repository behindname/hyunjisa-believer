class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :temple_id, :profile, :addressProvince, :addressDetail, :phone, :gender, :birthday, :registerday, :remarks, :ganzhi, :dharmaName, :email, :password)}
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name,:temple_id, :profile, :addressProvince, :addressDetail, :phone, :gender, :birthday, :registerday, :remarks, :ganzhi, :dharmaName, :email, :password, :current_password)}
  end

  private
  def user_not_authorized
    flash[:alert] = '권한이 없어서 해당 명령을 실행할 수 없습니다.'
    redirect_to root_path
  end

end
