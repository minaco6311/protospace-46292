class ApplicationController < ActionController::Base
  # Deviseのコントローラーが使われる前に実行
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # サインアップ時に許可するパラメータを追加
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :profile, :affiliation, :position])
  end
end
