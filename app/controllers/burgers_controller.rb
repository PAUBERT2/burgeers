class BurgersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :find_burger, only: [:edit, :destroy, :update, :show]

  def index

    @burgers = policy_scope(Burger).order(created_at: :desc)

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
    authorize @burger
  end

  def create
    @burger = Burger.new(burger_params)
    @burger.user = current_user
    authorize @burger
    if @burger.save
      redirect_to burger_path(@burger)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @burger.update(burger_params)
      redirect_to burger_path(@burger)
    else
      render :edit
    end
  end

  def destroy
    @burger.destroy
    redirect_to root_path
  end

  private

  def find_burger
    @burger = Burger.find(params[:id])
    authorize @burger
  end

    # Never trust parameters from the scary internet, only allow the white list through.
  def burger_params
    params.require(:burger).permit(:name, :description, :photo, :price, :quantity_max, :opening_days, :published)
  end

end
