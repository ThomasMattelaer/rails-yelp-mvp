class RestaurantsController < ApplicationController

  before_action :set_tasks, only: [:show, :edit, :update, :destroy]
  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def show
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new, status: :unprocessable_entity
    end

  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :category, :phone_number, :address)
  end

  def set_tasks
    @restaurant = Restaurant.find(params[:id])
  end
end
