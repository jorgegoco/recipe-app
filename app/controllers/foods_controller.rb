class FoodsController < ApplicationController
  def index
    @foods = Food.where(user: current_user) || []
  end

  def edit
    @food = Food.find(params[:id])
  end

  def update
    @food = Food.find(params[:id])
    if @food.update(food_params)
      redirect_to foods_path
    else
      render :edit
    end
  end

  def new
    @food = Food.new
    render 'new'
  end

  def create
    existing_food = Food.find_by(user: current_user, name: params[:food][:name],
                                 measurement_unit: params[:food][:measurement_unit], price: params[:food][:price])
    if existing_food
      existing_food.quantity += params[:food][:quantity].to_f
      @food = existing_food
    else
      @food = Food.new(food_params)
      @food.user = current_user
    end
    
    if @food.save
      redirect_to foods_path
    else
      render :new
    end
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    redirect_to foods_path
  end

  def new_from_recipe
    @food = Food.new
    @recipe_id = params[:recipe_id]
    render 'new_from_recipe'
  end

  def create_from_recipe
    existing_food = Food.find_by(user: current_user, name: params[:food][:name],
                                 measurement_unit: params[:food][:measurement_unit], price: params[:food][:price])
    if existing_food
      existing_food.quantity += 0
      @food = existing_food
    else
      @food = Food.new(food_params.except(:quantity))
      @food.user = current_user
      @food.quantity = 0
    end

    if @food.save
      redirect_to foods_path
    end
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
  end
end
