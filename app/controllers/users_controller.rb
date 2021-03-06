class UsersController < ApplicationController
  before_action :admin_user, only: [:index, :admin_edit]


  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      @user.send_activation_email
      flash[:success] = "You're registered!  Check your email to activate your account.  Once your email is confirmed, your first free sample pack will be shipped!"
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

  def sample_request
    @user = User.find(params[:id])
    shipment = @user.shipments.build
    if shipment.save
      flash[:success] = "shipment requested"
      redirect_to @user
    else
      render @user
    end
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

  def history
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,                :password_confirmation, :business, :street_address, :state, :zip, :city)
    end


end
