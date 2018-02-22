class Admin::BurgersController < ApplicationController

  def index
    @burgers = []
    policy_scope(Burger).each do |burger|
      if burger.user == current_user
        @burgers << burger
      end
    end
    return @burgers
  end

  private

  def burger_params
    params.require(:burger).permit(:name, :description, :image_url, :price, :opening_days, :quantity_max, :published)
  end

end
