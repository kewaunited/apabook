class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  private

  def current_user
    Account.find_by(id: session[:user_id])
  end

  def user_signed_in?
    !current_user.nil?
  end

  def sign_in(account)
    if account
      session[:user_id] = account.id
      redirect_to session.delete(:return_to) || root_path
    else
      flash.now[:error] = 'Wrong credentials'
      render :new
    end
  end
end
