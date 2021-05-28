class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user, except: [:index]

  
  def index
    @users = User.all
  end

  def show
    authorize @user
  end

  def edit
    authorize @user
  end

  def update
    authorize @user
    if @user.update(user_params)
      render 'show'
    else
      flash[:notice] = @user.errors.full_messages.join(',')
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end

  private
  
  def find_user
    @user =  User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :phone_number, :password, :password_confirmation, :avatar, address_attributes: [:id, :address_line, :state, :city, :street, :land_mark, :pincode])
  end

end