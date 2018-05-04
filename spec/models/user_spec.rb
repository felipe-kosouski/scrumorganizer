require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.new(name: 'Felipe Kosouski', username: 'felipe_123',
                     email: 'email@example.com', password: '123456')
  end

  it 'should be valid' do
    expect(@user).to be_valid
  end

  it 'should have a valid username' do
    @user.username = ".felipe_123"
    expect(@user).to_not be_valid
  end

  it 'should have a valid email' do
    @user.email = "$#email!@exampl123..com"
    expect(@user).to_not be_valid
  end

  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:email) }

  end

  it { should have_many(:projects) }

end