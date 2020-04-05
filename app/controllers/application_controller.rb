class ApplicationController < ActionController::Base
  helper_method :current_shop
  before_action :login_required, only: [:index, :show, :edit, :update, :destroy]

  private

  def current_shop
    @current_shop ||= Shop.find_by(id: session[:shop_id]) if session[:shop_id]
  end

  def login_required
    redirect_to login_url unless current_shop
  end
end
