require 'rails_helper'

describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  it "is valid with a username, first_name, last_name" do
    user = User.new(username: "testuser", first_name: "Test", last_name: "User")
    expect(user).to be_valid
  end


  it "is invalid without a username" do
    user = User.new(username: nil)
    user.valid?
    expect(user.errors[:username]).to include("can't be blank")
  end

  it "is invalid without a first_name" do
    user = User.new(first_name: nil)
    user.valid?
    expect(user.errors[:first_name]).to include("can't be blank")
  end

  it "is invalid without a last_name" do 
    user = User.new(last_name: nil)
    user.valid?
    expect(user.errors[:last_name]).to include("can't be blank")
  end

  describe "factories tests" do
    it "has a valid factory" do
      expect(FactoryGirl.build(:user)).to be_valid
    end
  end
end
