class Admin::BurgersController < ApplicationController
  before_action :find_burger, only: [:edit, :destroy, :update]

  def index
    @burgers = Burger.all.where(user == current_user)
  end

  def edit
  end

  def update
    if @burger.update(burger_params)
      redirect_to burger_path(@burger)
    else
      render 'burger/edit'
    end
  end

  def destroy
    @burger.destroy
    redirect_to burgers_path
  end

  private

  def find_burger
    @burger = Burger.find(params[:id])
  end

  def burger_params
    params.require(:burger).permit(:name, :description, :image_url, :price, :opening_days, :quantity_max, :published)
  end

end
