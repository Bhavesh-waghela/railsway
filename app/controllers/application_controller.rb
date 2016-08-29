class ApplicationController < ActionController::Base
  acts_as_token_authentication_handler_for User
  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }
  #before_action :authenticate_user!
  respond_to :html, :json


  def after_sign_in_path_for(resource)
    if current_user.admin? 
      rails_admin.dashboard_path
    end
  end
end