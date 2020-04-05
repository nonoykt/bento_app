class BentosController < ApplicationController
  before_action :set_bento, only: [:show, :edit, :update, :destroy]

  def index
    @bentos = current_shop.bentos.order(created_at: :desc)
  end

  def show
  end

  def new
    @bento = Bento.new
  end

  def edit
  end

  def update
    @bento.update!(bento_params)
    redirect_to bentos_url, notice: "御弁当「#{@bento.name}」を更新しました！"
  end

  def destroy
    @bento.destroy
    redirect_to bentos_url, notice: "御弁当「#{@bento.name}」を削除しました。"
  end

  def create
    @bento = current_shop.bentos.new(bento_params)

    if @bento.save
      redirect_to bentos_url, notice: "御弁当「#{@bento.name}」を登録しました！"
    else
      render :new
    end
  end

  private

  def bento_params
    params.require(:bento).permit(:name, :description)
  end

  def set_bento
    @bento = current_shop.bentos.find(params[:id])
  end
end
