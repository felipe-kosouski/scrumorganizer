require 'rails_helper'

RSpec.describe Role, type: :model do
  it 'should be valid' do
    role = create(:role)
    expect(role).to be_valid
  end

  describe "validations" do
    it { should validate_presence_of(:resource_type) }
  end

  it { should belong_to(:user) }

  it { should have_many(:users) }
end
