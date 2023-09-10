class ShoppingListController < ApplicationController
  def index
    @current_user = current_user
    @recipe = Recipe.find_by(id: params[:recipe_id])
    @foods = current_user.recipe_foods.includes(food: :user).map(&:food).uniq
    @total_price = @foods.map { |ingredient| ingredient.price * ingredient.total_quantity_recipes }.sum
  end

  def show
    @current_user = current_user
    @user_foods = current_user.foods
    @recipe_foods = current_user.recipe_foods.includes(food: :user).map(&:food).uniq
    @foods = current_user.recipe_foods.includes(food: :user).map(&:food).uniq
    @missing_foods = @user_foods - @recipe_foods - @foods
    @total_price = @missing_foods.map(&:price).sum
  end
end
