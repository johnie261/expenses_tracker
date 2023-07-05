require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'validations' do
    before do
      @category = Category.new(name: "dishes")
    end

    it "name should be present" do
     @category.name = ""
     expect(@category).to_not be_valid
    end

    it "name should be valid when present" do
        expect(@category).to_not be_valid
      end
  end
end