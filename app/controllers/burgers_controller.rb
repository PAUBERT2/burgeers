class BurgersController < ApplicationController

  def new
    @burger = Burger.new
  end

  def create
    @burger = Burger.new(burger_params)
    @burger.user = current_user
    if @burger.save
      redirect_to burger_path(@burger)
    else
      render 'burger/new'
    end
  end

  private

  def burger_params
    params.require(:burger).permit(:name, :description, :image_url, :price, :opening_days, :quantity_max, :published)
  end
end
