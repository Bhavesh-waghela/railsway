class ApplicationController < ActionController::Base
  # acts_as_token_authentication_handler_for User, fallback_to_devise: false
  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }
  respond_to :html, :json
  use_growlyflash

  def after_sign_in_path_for(resource)
    if current_user.admin?
      rails_admin.dashboard_path
    else 
     root_path
    end
  end

  protected

  def user_token_authenticable?
    # This ensure the token can be used only for JSON requests (you may want to enable it for XML too, for example)
    return false unless request.format.json?
    return false if tokenized_user_identifier.blank?

    # `nil` is still a falsy value, but I want a strictly boolean field here
    tokenized_user.try(:token_authenticable?) || false
  end

  private

  def tokenized_user
    # I use email with devise, you can use whatever you want
    User.find_by(email: tokenized_user_identifier.to_s)
  end

  def tokenized_user_identifier
    # Customize this based on Simple Token Authentication settings
    request.headers['X-User-Email'] || params[:user_email]
  end
end