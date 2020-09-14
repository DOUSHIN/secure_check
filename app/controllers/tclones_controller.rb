class TclonesController < ApplicationController

  before_action :set_tclone, only: [:edit, :update, :destroy]

  def new
    @tclone = Tclone.new
  end

  def create
    @tclone = Tclone.new(tclone_params)
    if params[:back]
      render :new
    else
      if @tclone.save
        redirect_to tclones_path, notice: "ツイートしました"
      else
        render :new
      end
    end
  end

  def index
    @tclones = Tclone.all
  end

  def confirm
    @tclone = Tclone.new(tclone_params)
    render :new if @tclone.invalid?
  end

  def edit
  end

  def update
    if @tclone.update(tclone_params)
      redirect_to tclones_path, notice: "編集しました"
    else
      render :edit
    end
  end

  def destroy
    @tclone.destroy
    redirect_to tclones_path, notice:"削除しました"
  end

  private
  def tclone_params
    params.require(:tclone).permit(:content)
  end

  def set_tclone
    @tclone = Tclone.find(params[:id])
  end

end
