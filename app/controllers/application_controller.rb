class ApplicationController < ActionController::Base
  # Deviseのコントローラーが使われる前に実行
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # サインアップ時・アカウント更新時に許可するパラメータを追加
  def configure_permitted_parameters
    added_attrs = [:name, :profile, :affiliation, :occupation, :position]

    devise_parameter_sanitizer.permit(:sign_up,        keys: added_attrs)
    devise_parameter_sanitizer.permit(:account_update, keys: added_attrs)
  end
end
