class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    authorize current_user
    @users = User.all
  end

  def show
    authorize @user
  end

end