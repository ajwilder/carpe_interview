class UsersController < ApplicationController
  before_action :admin_user, only: [:index, :admin_edit]


  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "You're registered!  Confirm your email and your first free sample pack will be shipped!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def index
    @users = User.all
  end

  def destroy
  end

  def show
    @user = User.find(params[:id])
  end

  def admin_edit
    @user = User.find(params[:id])
  end

  def admin_update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to users_path
    else
      render 'admin_edit'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,                :password_confirmation, :business, :street_address, :state, :zip, :city)
    end


end
