require 'rails_helper'

RSpec.describe Story, type: :model do
  it 'should be valid' do
    story = create(:story)
    expect(story).to be_valid
  end

  describe "validations" do
    it { should validate_presence_of(:name) }
  end

  it { should belong_to(:board) }
end
