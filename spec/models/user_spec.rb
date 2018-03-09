require 'rails_helper'

RSpec.describe User, type: :model do
  it 'has a valid factory' do
    expect(FactoryBot.create(:user)).to be_valid
  end

  it 'is invalid without a name' do
    user = User.create(email: 'rob@foo.com', name: nil)
    expect(user).to_not be_valid
  end

  it 'is invalid without an email' do
    user = User.create(email: nil, name: 'John Doe')
    expect(user).to_not be_valid
  end
end
