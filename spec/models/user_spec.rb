require 'rails_helper'

RSpec.describe User, type: :model do
  it 'name should be present' do
    @user = User.new(name: 'john', email: 'john@test.com', password: '1234567')
    check = @user.valid?

    expect(check).to eq(true)
  end

  it 'name should be present' do
    @user = User.new(name: '', email: 'john@test.com', password: '1234567')
    check = @user.valid?

    expect(check).to eq(false)
  end

  it 'password should have a minimumm of 6 characters' do
    @user = User.new(encrypted_password: 'tush')
    expect(@user).not_to be_valid
  end
end
