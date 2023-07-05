require 'rails_helper'

RSpec.describe '/categories path', type: :system do
  include Warden::Test::Helpers

  let!(:user) { User.create(name: 'John', email: 'john@gmail.com', password: 'password') }
  let!(:category) { Category.create(name: 'Dishes', user: user, icon: icon) }
  let!(:icon) { fixture_file_upload(Rails.root.join('spec/fixtures/files/dish.png'), 'image/png') }
  
  it 'should show the user\'s categories name' do
    login_as(user)
    visit categories_path
    expect(page).to have_content(category.name)
  end

  it 'should show logout button' do
    login_as(user)
    visit categories_path
    expect(page).to have_button('Log Out')
  end

  it 'navigates to category expenses page on category click' do
    login_as(user)
    visit categories_path
    click_link(category.name)
    expect(page).to have_current_path(category_expenses_path(category))
  end

  it 'navigates to new category page on "Add new category" link click' do
    login_as(user)
    visit categories_path
    click_link 'Add new category'
    expect(page).to have_current_path(new_category_path)
  end
end