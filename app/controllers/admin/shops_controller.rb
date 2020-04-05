class Admin::ShopsController < ApplicationController

  def index
    @shops = Shop.all
  end

  def show
    @shop = Shop.find(params[:id])
  end

  def new
    @shop = Shop.new
  end

  def edit
    @shop = Shop.find(params[:id])
  end

  def create
    @shop = Shop.new(shop_params)

    if @shop.save
      redirect_to admin_shop_url(@shop), notice: "ショップ「#{@shop.name}」を開店しました！"
    else
      render :new
    end
  end

  def update
    @shop = Shop.find(params[:id])

    if @shop.update
      redirect_to admin_shop_url(@shop), notice: "ショップ「#{@shop.name}」を更新しました！"
    else
      render :edit
    end
  end

  def destroy
    @shop = Shop.find(params[:id])
    @shop.destroy
    redirect_to admin_shops_url, notice: "ショップ「#{@shop.name}」を閉店しました。"
  end

  private

  def shop_params
    params(:shop).permit(:name, :email, :admin, :password, :password_confirmation)
  end
end
