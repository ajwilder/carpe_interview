class SessionsController < ApplicationController
  def new
    end

    def create
      @user = User.find_by(email: params[:session][:email].downcase)
      if @user && @user.authenticate(params[:session][:password])
        if @user.activated?
          log_in @user
          params[:session][:remember_me] == '1' ? remember(@user) : forget(@user)
          redirect_back_or '/'
        else
          log_in @user
          message = "You are logged in. Your account email has not been confirmed. Please confirm your email to receive first shipment. \n "
          message += "Check your email for the activation link"
          flash[:warning] = message
          redirect_to @user
        end
      else
        flash.now[:danger] = 'Invalid email/password combination'
        render 'new'
      end
    end

    def destroy
      log_out if logged_in?
      redirect_to root_url
    end
end