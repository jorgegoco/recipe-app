class ShoppingListController < ApplicationController
  def index

    @all_recipe_foods = []
    @needed_recipe_foods = []
    @needed_recipe_foods_price = 0

    @user_foods = Food.where(user_id: current_user.id)
    @user_recipes = Recipe.where(user_id: current_user.id)
    @user_recipes.each do |user_recipe|
      @recipe_foods = RecipeFood.where(recipe_id: user_recipe.id)
      @recipe_foods.each do |recipe_food|
        if @all_recipe_foods.find { |f| f.food_id == recipe_food.food_id }.nil?
          @all_recipe_foods.push(recipe_food)
        else
          @all_recipe_foods.find { |f| f.food_id == recipe_food.food_id }.quantity += recipe_food.quantity
        end
      end
    end
    @all_recipe_foods.each do |all_recipe_food|
      quantity_needed = all_recipe_food.quantity
      user_food_quantity = @user_foods.find { |f| f.id == all_recipe_food.food_id }.quantity
      value = user_food_quantity - quantity_needed
      next if value >= 0
      all_recipe_food.quantity = value * -1
      @needed_recipe_foods.push(all_recipe_food)
    end
    @needed_recipe_foods.each do |needed_recipe_food|
        @needed_recipe_foods_price += needed_recipe_food.food.price * needed_recipe_food.quantity
    end     
  end

  def show
    @recipe_id = params[:recipe_id]
    @food_amount = 0
    @total_price = 0
    @list_of_foods = []
    @need_foods = RecipeFood.where(recipe_id: @recipe_id)
    @need_foods.each do |need_food|
      new_food_id = need_food.food_id
      new_val = Food.where(user: current_user).where(id: new_food_id).first.quantity
      quantity_needed = new_val - need_food.quantity
      next if quantity_needed >= 0

      need_food.quantity = quantity_needed * -1
      @list_of_foods << need_food
    end
    @list_of_foods.each do |f|
      @total_price += f.food.price * f.quantity
    end
  end
end
