class SessionsController < ApplicationController
  skip_before_action :login_required

  def new
  end

  def create
    shop = Shop.find_by(email: session_params[:email])

    if shop&.authenticate(session_params[:password])
      session[:shop_id] = shop.id
      redirect_to root_url, notice: 'ログインしました！'
    else
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to bentos_url, notice: 'ログアウトしました！'
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
