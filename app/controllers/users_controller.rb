class UsersController < ApplicationController
  # before_action :set_user, only: %i[new show edit]
  def new
    @user = User.new
  end

  def create
    @user = User.new
    @user.user_name = user_params[:user_name]
    @user.display_name = user_params[:display_name]
    @user.country = user_params[:country]
    @user.email = user_params[:email]
    @user.password = user_params[:password]

    respond_to do |format|
      if @user.save
        format.html { redirect_to user_url(@user), alert: 'Account created, welcome to Nappy Overflow!'}
      else
        format.html { render :new, status: :bad_request }
      end
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit; end

  # def set_user
  #  
  # end

  def user_params
    params.fetch(:user, {})
  end
end