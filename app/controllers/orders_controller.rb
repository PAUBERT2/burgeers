class OrdersController < ApplicationController

  def new
    # créer une instance d'order pour contruire le formulaire avec les champs nommé
    @order = Order.new
    @burger = Burger.find(params[:burger_id])
  end

  def create

    @order = Order.new(order_params)
    @order.user = current_user
    @order.burger = Burger.find(params[:burger_id])

    @order.total_price = @order.quantity * @burger.price

    if @order.save
      redirect_to order_path(@order)
    else
      render :new
    end
  end

  def index
    # methode listant toutes les commandes
    @orders = Order.all
    # methode listant toutes les commandes d'un utilisateur
    @orders = Order.where(user: current_user)

  end

  def show
    @order = Order.find(params[:id])
  end

  private
  def order_params
    params.require(:order).permit(:quantity)
  end
end








