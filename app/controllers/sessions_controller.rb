class SessionsController < ApplicationController
  def create
    account = Account.authenticate(params[:email], params[:password])
    sign_in(account)
  end

  def destroy
    reset_session
    redirect_to root_path
  end
end
