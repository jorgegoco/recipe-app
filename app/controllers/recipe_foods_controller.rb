class RecipeFoodsController < ApplicationController
  def new
    @recipe_food = RecipeFood.new
    @recipe_id = params[:recipe_id]
    @foods = current_user.foods
  end

  def create
    existing_recipe_food = RecipeFood.find_by(recipe_id: params[:recipe_id], food_id: params[:recipe_food][:food_id])
    if existing_recipe_food
      existing_recipe_food.quantity += params[:recipe_food][:quantity].to_f
      @recipe_food = existing_recipe_food
    else
      @recipe_food = RecipeFood.new(params_recipe_foods)  
    end

    if @recipe_food.save
      redirect_to recipe_path(params[:recipe_id])
    else
      render 'new'
    end
  end

  def destroy
    @recipe_food = RecipeFood.find(params[:id])
    @recipe_food.destroy
    redirect_to recipe_path(@recipe_food.recipe_id)
    flash[:notice] = 'Ingredient deleted successfully'
  end

  private

  def params_recipe_foods
    params.require(:recipe_food).permit(:quantity, :food_id, :recipe_id)
  end
end
