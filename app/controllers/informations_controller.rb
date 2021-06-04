class InformationsController < ApplicationController
  def index
    @information = Information.order("created_at DESC")
  end

  def new
    @information = Information.new
  end

  def create
    @information = Information.new(information_params)
    if @information.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def information_params
    params.require(:information).permit(:prefecture_id)
  end
end
