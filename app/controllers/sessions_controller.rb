class SessionsController < ApplicationController
  def create
    @user = User.find_by(username: params[:username])
    respond_to do |format|
      if @user && @user.authenticate(params[:password])
        login!
        # render json: {
        #   logged_in: true,
        #   user: @user
        # }
        format.html { redirect_to "/" }
      else
        # render json: { 
        #   status: 401,
        #   errors: ['no such user, please try again']
        # }
        format.html { redirect_to "/login", status: :bad_request}
      end
    end
  end

  def is_logged_in?
    if logged_in? && current_user
      render json: {
        logged_in: true,
        user: current_user
      }
    else
      render json: {
        logged_in: false,
        message: 'no such user'
      }
    end
  end

  def destroy
    respond_to do |format|
      logout!
      # render json: {
      #   status: 200,
      #   logged_out: true
      # }
      format.html { redirect_to "/" }
    end
  end
  
  private
    def session_params
          params.require(:user).permit(:username, :password)
    end
  end