class BentosController < ApplicationController
  def index
    @bentos = Bento.all
  end

  def show
    @bento = Bento.find(params[:id])
  end

  def new
    @bento = Bento.new
  end

  def edit
    @bento = Bento.find(params[:id])
  end

  def update
    bento = Bento.find(params[:id])
    bento.update!(bento_params)
    redirect_to bentos_url, notice: "御弁当「#{bento.name}」を更新しました！"
  end

  def destroy
    bento = Bento.find(params[:id])
    bento.destroy
    redirect_to bentos_url, notice: "御弁当「#{bento.name}を削除しました。」"
  end

  def create
    @bento = Bento.new(bento_params)

    if @bento.save
      redirect_to bentos_url, notice: "御弁当「#{bento.name}」を登録しました！"
    else
      render :new
    end
  end

  private

  def bento_params
    params.require(:bento).permit(:name, :description)
  end
end
