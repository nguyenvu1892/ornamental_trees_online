class SessionsController < ApplicationController
  def new
  end

  def create
    auth = request.env["omniauth.auth"]
    if auth.present?
      user = User.from_omniauth(auth)
      if user
        render json: {
            status: :success
        }
        log_in user
      else
        render json: {
            status: :error
        }
      end
    else
      user = User.find_by email: params[:session][:email].downcase
      if user && user.authenticate(params[:session][:password])
        log_in user
        if user.admin?
          redirect_to admin_root_url
          flash[:admin] = t ".admin"
        else
          redirect_to root_url
          flash[:user] = t ".user"
        end
      else
        flash.now[:danger] = t ".danger"
        render :new
      end
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end
