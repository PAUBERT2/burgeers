class BurgersController < ApplicationController
  before_action :find_burger, only: [:edit, :destroy, :update, :show]

  def index
    @burgers = Burger.all

    @users = User.where.not(latitude: nil, longitude: nil)

    @markers = @users.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude#,
        # infoWindow: { content: render_to_string(partial: "/flats/map_box", locals: { flat: flat }) }
      }
    end
  end

  def show
  end


  def new
    @burger = Burger.new
  end

  def create
    @burger = Burger.new(burger_params)
    @burger.user = current_user
    if @burger.save
      redirect_to burger_path(@burger)
    else
      render :new
    end
  end

  def edit
    if @burger.user != current_user
      flash[:alert] = "You are not authorized to perform this action."
      render :show
    end
  end

  def update
    if @burger.user == current_user
      if @burger.update(burger_params)
        redirect_to burger_path(@burger)
      else
        render :edit
      end
    else
      flash[:alert] = "You are not authorized to perform this action."
      render :show
    end
  end

  def destroy
    if @burger.user == current_user
      @burger.destroy
      redirect_to root_path
    else
      flash[:alert] = "You are not authorized to perform this action."
      render :show
    end
  end

  private

  def find_burger
    @burger = Burger.find(params[:id])
  end

    # Never trust parameters from the scary internet, only allow the white list through.
  def burger_params
    params.require(:burger).permit(:name, :description, :photo, :price, :quantity_max, :opening_days, :published)
  end

end
