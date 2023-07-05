require 'rails_helper'

RSpec.describe 'Expenses', type: :feature do
   let!(:user) { User.create(name: 'John', email: 'john@gmail.com', password: 'password') }
   let!(:category) { Category.create(name: 'Dishes', user: user, icon: icon) }
   let!(:icon) { fixture_file_upload(Rails.root.join('spec/fixtures/files/dish.png'), 'image/png') }
  
    describe 'creating a new expense' do

      it 'creates a new expense' do
        visit new_category_expense_path(category.id)
      
        within('form') do
          fill_in 'expense_name', with: 'Travel Expense'
          fill_in 'expense_amount', with: 100
          select 'Dishes', from: 'expense_category_ids'
        end
  
        click_button 'Create Expense'
  
        expect(page).to have_current_path(category_expenses_path(category))
      end
    end
  end
  