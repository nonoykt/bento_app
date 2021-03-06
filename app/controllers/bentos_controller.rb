class BentosController < ApplicationController
  before_action :set_bento, only: [:show, :edit, :update, :destroy]

  def index
    @q = current_shop.bentos.ransack(params[:q])
    @bentos = @q.result(distinct: true).page(params[:page])

    respond_to do |format|
      format.html
      format.csv { send_data @bentos.generate_csv, filename: "bentos-#{Time.zone.now.strftime('%Y%m%d%S')}.csv"}
    end
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
    head :no_content
  end

  def create
    @bento = current_shop.bentos.new(bento_params)

    if params[:back].present?
      render :new
      retuen
    end

    if @bento.save
      logger.debug "bento: #{@bento.attributes.inspect}"
      BentoMailer.creation_email(@bento).deliver_now
      SampleJob.perform_later
      redirect_to bentos_url, notice: "御弁当「#{@bento.name}」を登録しました！"
    else
      render :new
    end
  end

  def confirm_new
    @bento = current_shop.bentos.new(bento_params)
    render :new unless @bento.valid?
  end

  def bento_logger
    @bento_logger ||= Logger.new('log/bento.log', 'daily')
  end

  def import
    current_shop.bentos.import(params[:file])
    redirect_to bentos_url, notice: "お弁当を追加しました。"
  end

  private

  def bento_params
    params.require(:bento).permit(:name, :description, :image)
  end

  def set_bento
    @bento = current_shop.bentos.find(params[:id])
  end
end
