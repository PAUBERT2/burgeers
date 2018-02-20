class Admin::BurgersController < ApplicationController

  def index
    @burgers = Burger.all.where(user == current_user)
  end

  private

  def burger_params
    params.require(:burger).permit(:name, :description, :image_url, :price, :opening_days, :quantity_max, :published)
  end

end
