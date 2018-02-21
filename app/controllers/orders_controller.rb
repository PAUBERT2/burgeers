class OrdersController < ApplicationController

  def new
    # créer une instance d'order pour contruire le formulaire avec les champs nommé
    @order = Order.new
    @burger = Burger.find(params[:burger_id])
  end

  def create

    @order = Order.new(order_params)
    @order.user = current_user
    @burger =  Burger.find(params[:burger_id])
    @order.burger = @burger
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


  def index_cooker_orders
    # methode listant toutes les commandes
    @orders = []
    Order.all.each do |order|
      if order.burger.user_id == current_user.id
        @orders << order
      end
    end
    # methode listant toutes les commandes d'un utilisateur
    return @sorders
  end

  def show
    @order = Order.find(params[:id])
  end

  private
  def order_params
    params.require(:order).permit(:quantity)
  end
end








