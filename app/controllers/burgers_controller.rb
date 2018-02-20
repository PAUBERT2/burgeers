class BurgersController < ApplicationController
  before_action :set_burger, only: [:show]

  def index
    @burgers = Burger.all
  end

  def show
    @burger = Burger.find(params[:id])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_burger
    @burger = Burger.find(params[:id])
  end

    # Never trust parameters from the scary internet, only allow the white list through.
  def burger_params
    params.require(:burger).permit(:name, :description, :image_url, :price, :quantity_max, :opening_days, :published)
  end

end
