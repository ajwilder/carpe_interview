class AccountActivationsController < ApplicationController

  def edit
    user = User.find_by(email: params[:email])
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      user.activate
      log_in user
      shipment = user.shipments.build
      shipment.save
      flash[:success] = "Email confirmed.  Thank you!  Your first sample shipment is in the mail.  Check back for tracking information."
      redirect_to user
    else
      flash[:danger] = "Invalid activation link"
      redirect_to root_url
    end
  end
end
