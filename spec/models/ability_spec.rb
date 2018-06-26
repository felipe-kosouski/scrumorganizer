require 'rails_helper'
require "cancan/matchers"

RSpec.describe Ability, type: :model do
  before(:each) do
    @project = create(:project)
  end

  it 'should manage projects' do
    @project.user.add_role :manager, @project
    ability = Ability.new(@project.user)

    expect(ability).to be_able_to(:manage, @project)
  end

  it 'should able master only to read and update projects ' do
    @project.user.add_role :master, @project
    ability = Ability.new(@project.user)

    expect(ability).to be_able_to(:read_update, @project)
  end

  it 'should able developer only to read project' do
    @project.user.add_role :developer, @project
    ability = Ability.new(@project.user)

    expect(ability).to be_able_to(:read, @project)
  end
end
