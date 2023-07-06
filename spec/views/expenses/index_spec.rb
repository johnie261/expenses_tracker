require 'rails_helper'

RSpec.feature 'Expenses', type: :feature do
  let!(:user) { User.create(name: 'John', email: 'john@gmail.com', password: 'password') }
  let!(:category) { Category.create(name: 'Dishes', user:, icon:) }
  let!(:icon) { fixture_file_upload(Rails.root.join('spec/fixtures/files/dish.png'), 'image/png') }

  it 'Displaying expenses on index page' do
    visit category_expenses_path(category_id: category.id)

    expect(page).to have_content('EXPENSES')
    expect(category.expenses.count).to eq(0)

    within '.amount' do
      expect(page).to have_content('Total Amount: $0.00')
    end

    expect(page).to have_link('Add new expense', href: new_category_expense_path(category_id: category.id))
  end
end
