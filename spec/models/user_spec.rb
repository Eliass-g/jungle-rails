require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it "validates name" do
      user = User.create("email": "test@test.ca", "password": "test", "password_confirmation": "wrong").valid?
      expect(user).to eql (false)
    end
    it "validates email" do
      user = User.create("name": "Test Case", "password": "test", "password_confirmation": "wrong").valid?
      expect(user).to eql (false)
    end
    it "validates password" do
      user = User.create("name": "Test Case", "email": "test@test.ca", "password_confirmation": "test").valid?
      expect(user).to eql (false)
    end
    it "validates password confirmation" do
      user = User.create("name": "Test Case", "email": "test@test.ca", "password": "test").valid?
      expect(user).to eql (false)
    end
    it "validates password is equal to password confirmation" do
      user = User.create("name": "Test Case", "email": "test@test.ca", "password": "test", "password_confirmation": "testa").valid?
      expect(user).to eql (false)
    end
    it "validates password minimum length of four" do
      user = User.create("name": "Test Case", "email": "test@test.ca", "password": "tes", "password_confirmation": "tes").valid?
      expect(user).to eql (false)
    end
    it "validates email uniqueness" do
      userA = User.create("name": "Test Case", "email": "test@test.ca", "password": "test", "password_confirmation": "test")
      userB = User.create("name": "Test Case", "email": "TEST@test.ca", "password": "test", "password_confirmation": "test").valid?
      expect(userB).to eql (false)
    end
  end

  describe '.authenticate_with_credentials' do
    it "check if correct user is returned" do
      userA = User.create("name": "Test Case", "email": "test1@test.ca", "password": "test", "password_confirmation": "test")
      userB = User.authenticate_with_credentials("test1@test.ca", "test")
      expect(userA). to eql (userB)
    end
  end
end
