require 'rails_helper'

RSpec.describe '/category_expense path', type: :system do
  include Warden::Test::Helpers

  let!(:user) { User.create(name: 'John', email: 'john@gmail.com', password: 'password') }

  it 'creates a new category' do
    user = User.create(name: 'John', email: 'john@gmail.com', password: 'password')
  
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
  
    expect(page).to have_current_path(categories_path)

    visit new_category_path

    fill_in 'Category Name', with: 'Travel'
    
    attach_file 'category_icon', Rails.root.join('spec/fixtures/files/travel.png')
    click_button 'Create Category'
    expect(page).to have_current_path(categories_path)
    
  end
end