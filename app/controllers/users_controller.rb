class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    # my implementation
    # @user = User.new
    # @user.user_name = user_params[:user_name]
    # @user.display_name = user_params[:display_name]
    # @user.country = user_params[:country]
    # @user.email = user_params[:email]
    # @user.password = user_params[:password]

    # implementation from auth guide
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        login!
        format.html { redirect_to user_url(@user), alert: 'Account created, welcome to Nappy Overflow!'}
      else
        format.html { render :new, status: :bad_request }
      end
    end
  end

  def login
    @user
  end

  # def logout
  #   redirect_to '/'
  # end

  def show
  end

  def update

    respond_to do |format|
      @user.display_name = user_params[:display_name]
      @user.country = user_params[:country]
      @user.email = user_params[:email]
      @user.password = user_params[:password]
      @user.save

      format.all {redirect_to user_url(@user), alert: "Details saved."}
    end
  end

  def edit; end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    # params.fetch(:user, {})
    params.require(:user).permit(:username, :display_name, :country, :email, :password, :password_confirmation)
  end
end