require 'rails_helper'

RSpec.describe 'Users', type: :feature do
  it 'show home page' do
    visit root_path
    assert page.has_content?('Expense Tracker')
  end

  it 'user can sign up' do
    visit new_user_registration_path
    fill_in('Full Name', with: 'john')
    fill_in('Email', with: 'john@gmail.com')
    fill_in('Password', with: 'Password')
    fill_in('Confirm Password', with: 'Password')
    click_button 'Next'
    expect(page).to have_content 'CATEGORIES'
  end

  it 'show sign-in page' do
    User.create(name: 'john', email: 'john@gmail.com', password: 'Password')
    visit new_user_session_path
    fill_in('Email', with: 'john@gmail.com')
    fill_in('Password', with: 'Password')
    click_button 'Log in'
    expect(page).to have_content 'CATEGORIES'
  end
end