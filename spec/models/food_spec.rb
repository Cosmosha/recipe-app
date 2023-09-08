require 'rails_helper'

RSpec.describe Food, type: :model do
  describe 'validations' do
    it 'is valid with a name and a price greater than -1' do
      user = User.create(name: 'Test User', email: 'test@example.com', password: 'password')
      food = Food.new(name: 'Pasta', price: 0)
      food.user = user
      expect(food).to be_valid
    end

    it 'is not valid without a name' do
      food = Food.new(price: 10)
      expect(food).not_to be_valid
    end

    it 'is not valid with a negative price' do
      food = Food.new(name: 'Pasta', price: -5)
      expect(food).not_to be_valid
    end

    it 'is valid with a price of 6' do
      user = User.create(name: 'Test User', email: 'test@example.com', password: 'password')
      food = Food.new(name: 'Pasta', price: 6)
      food.user = user
      expect(food).to be_valid
    end
  end

  describe 'associations' do
    it 'belongs to a user' do
      association = described_class.reflect_on_association(:user)
      expect(association.macro).to eq(:belongs_to)
    end

    it 'has many recipe_foods' do
      association = described_class.reflect_on_association(:recipe_foods)
      expect(association.macro).to eq(:has_many)
    end

    it 'has many recipes through recipe_foods' do
      association = described_class.reflect_on_association(:recipes)
      expect(association.macro).to eq(:has_many)
      expect(association.through_reflection.name).to eq(:recipe_foods)
    end
  end

  describe 'total_quantity_recipes' do
    it 'calculates the total quantity of recipes using this food' do
      user = User.create(name: 'Test User', email: 'test@example.com', password: 'password')
      food = Food.create(name: 'Pasta', price: 10, user:)
      recipe1 = Recipe.create(name: 'Recipe 1', user:)
      recipe2 = Recipe.create(name: 'Recipe 2', user:)

      RecipeFood.create(food:, recipe: recipe1, quantity: 3)
      RecipeFood.create(food:, recipe: recipe2, quantity: 2)
      food.reload
      total_quantity = food.recipe_foods.sum(:quantity)
      expect(food.total_quantity_recipes).to eq(total_quantity)
    end
  end
end
