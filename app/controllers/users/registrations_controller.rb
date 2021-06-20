# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  before_action :find_user, only: [:edit, :update]

  # GET /resource/sign_up
  def new
    @user = User.new
    @user.build_address
  end

  # POST /resource
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "User created successfully"
      redirect_to user_path(@user)
    else
      flash[:error] = @user.errors.full_messages.join(',')
      render 'new'
    end
  end

  # GET /resource/edit
  # def edit
  # end

  # PUT /resource
  def update
    if @user.update_without_password(user_params)
      flash[:notice] = "User updated successfully"
      redirect_to current_user.admin? ? root_path : edit_user_registration_path(id: @user.id)
    else
      flash[:error] = @user.errors.full_messages.join(',')
      render 'edit'
    end
  end

  private

  def find_user
    @user = User.find_by(id: params[:id] || params[:user][:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :phone_number, :avatar, address_attributes: [:id, :address_line, :state, :city, :street, :land_mark, :pincode])
  end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
