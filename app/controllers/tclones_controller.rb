class TclonesController < ApplicationController

  def new
    @tclone = Tclone.new
  end

  def create
    @tclone = Tclone.new(tclone_params)
    @tclone.save
  end

  def index
    @tclones = Tclone.all
  end

  private
  def tclone_params
    params.require(:tclone).permit(:content)
  end

end
