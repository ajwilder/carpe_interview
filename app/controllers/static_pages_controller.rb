class StaticPagesController < ApplicationController
  before_action :admin_user, only: [:admin_page]

  def home
  end

  def info
  end

  def admin_page
  end
end
