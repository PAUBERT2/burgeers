class OrdersController < ApplicationController

  def new
    # créer 1 instance d'order et 1 instance burger pour contruire le formulaire avec les champs nommés et le chemin nested
    @order = Order.new
    @burger = Burger.find(params[:burger_id])
  end

  def create
    # cré 1 instance order en utilisant le hash quantité des params (sinon faudrait demander la clé du hash et l'affecter, plus compliqué..)
    @order = Order.new(order_params)
    @order.user = current_user
    # burger_id et non pas id, parce qu'on a nested pour pouvoir récupérer l'id du burger
    @order.burger = Burger.find(params[:burger_id])

    @order.total_price = @order.quantity * @burger.price
    # il faut pernser à faire les strong params sinon c'est jamais sauvegarder en bdd et ca passe en else
    if @order.save
      redirect_to order_path(@order)
    else
    # suffit juste d'indiquer le nom et comprend qu'il faut le chercher en local par défaut, sinon '../jfk/kljf/nom'
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








