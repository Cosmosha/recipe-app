require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  describe 'validations' do
    it 'is not valid with a non-integer quantity' do
      recipe_food = RecipeFood.new(quantity: 'abc')
      expect(recipe_food).not_to be_valid
    end

    it 'is not valid with a quantity less than or equal to 0' do
      recipe_food = RecipeFood.new(quantity: -1)
      expect(recipe_food).not_to be_valid
    end
  end

  describe 'associations' do
    it 'belongs to a user' do
      association = described_class.reflect_on_association(:user)
      expect(association.macro).to eq(:belongs_to)
    end

    it 'belongs to a food' do
      association = described_class.reflect_on_association(:food)
      expect(association.macro).to eq(:belongs_to)
    end

    it 'belongs to a recipe' do
      association = described_class.reflect_on_association(:recipe)
      expect(association.macro).to eq(:belongs_to)
    end
  end
end
