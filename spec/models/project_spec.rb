require 'rails_helper'

RSpec.describe Project, type: :model do

  before(:each) do
    @project = create(:project)
  end

  it 'should be valid' do
    expect(@project).to be_valid
  end

  describe "validations" do
    it { should validate_presence_of(:name) }
  end

  it 'should have a valid user_id' do
    @project.user_id = nil
    expect(@project).to_not be_valid
  end

  it 'should have name' do
    @project.name = " "
    expect(@project).to_not be_valid
  end

  it 'user should have manager role after create project' do
    @project.user.has_role? :manager, @project
  end

  it { should have_many(:collaborators) }

  it { should belong_to(:user) }

  it { should have_many(:boards) }
end
