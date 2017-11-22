require 'rails_helper'

RSpec.describe List, type: :model do

  pending "is valid with a list_name"
  pending "is invalid without a list_name"

  pending "test public list visibility"
  pending "test collaborators"

  describe "factories tests" do
    it "has a valid factory" do 
      expect(FactoryGirl.build(:list)).to be_valid
    end
  end
end
