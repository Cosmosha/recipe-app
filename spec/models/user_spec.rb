require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { User.new(name: 'cosmos', email: 'cosmos@gmail.com', password: 'password') }

  describe 'validations' do
    it 'is valid with a name, email, and password' do
      expect(user).to be_valid
    end

    it 'is invalid without a name' do
      user.name = nil
      expect(user).to_not be_valid
    end

    it 'is invalid without an email' do
      user.email = nil
      expect(user).to_not be_valid
    end

    it 'is invalid without a password' do
      user.password = nil
      expect(user).to_not be_valid
    end
  end
end
