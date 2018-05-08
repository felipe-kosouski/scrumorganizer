require 'rails_helper'

RSpec.describe Project, type: :model do

  it 'should be valid' do
    project = create(:project)
    expect(project).to be_valid
  end

  describe "validations" do
    it { should validate_presence_of(:name) }
  end

  it { should belong_to(:user) }

  it { should have_many(:boards) }
end
