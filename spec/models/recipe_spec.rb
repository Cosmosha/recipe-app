require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe 'validations' do
    it 'is invalid without a name' do
      recipe = Recipe.new(description: 'A delicious recipe')
      expect(recipe).not_to be_valid
    end

    it 'is invalid without a description' do
      recipe = Recipe.new(name: 'Pancakes')
      expect(recipe).not_to be_valid
    end

    it 'Recipe cooking time should be numeric' do
      recipe = Recipe.new(cooking_time: '45 minutes')
      expect(recipe).not_to be_valid
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

    it 'has many foods through recipe_foods' do
      association = described_class.reflect_on_association(:foods)
      expect(association.macro).to eq(:has_many)
      expect(association.through_reflection.name).to eq(:recipe_foods)
    end
  end
end
