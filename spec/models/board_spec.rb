require 'rails_helper'

RSpec.describe Board, type: :model do
  it 'should be valid' do
    board = create(:board)
    expect(board).to be_valid
  end

  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:position)}
  end

  it { should belong_to(:project) }
  it { should have_many(:stories) }

end
