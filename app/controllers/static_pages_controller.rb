class StaticPagesController < ApplicationController
  before_action :admin_user, only: [:admin_page, :shipments]

  def home
  end

  def info
  end

  def admin_page
  end

  def shipments
    @shipments = Shipment.all
  end

end
