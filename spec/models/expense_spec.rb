require 'rails_helper'

RSpec.describe Expense, type: :model do
  describe 'validations' do
    before do
      @expense = Expense.new(name: "Sushi", amount: 25)
    end

    it "name should be present" do
     @expense.name = ""
     expect(@expense).to_not be_valid
    end

    it "name should be valid when present" do
        expect(@expense).to_not be_valid
      end

      it 'amount shoud be numeric' do
        @expense.amount = ''
        expect(@expense).to_not be_valid
      end
  
      it 'amount shoud be an integer' do
        @expense.amount = 0.65
        expect(@expense).to_not be_valid
      end

      it 'amount should be valid' do
        expect(@expense.amount).to be >= 0
      end

      it 'amount shoud be greater than or equal to zero' do
        @expense.amount = -2
        expect(@expense).to_not be_valid
      end

    end
end