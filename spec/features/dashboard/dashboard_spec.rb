require 'rails_helper'

RSpec.feature "Dashboard", type: :feature do
  it 'should access users root path and find name' do
    user = create(:user)
    login_as(user, scope: :user)
    visit users_root_path
    expect(page).to have_selector('div.profile-usertitle-name', text: user.name)
  end

  it 'should access users root path and find menu links' do
    user = create(:user)
    login_as(user, scope: :user)
    visit users_root_path
    expect(page).to have_selector(:css, "a[href='#{users_root_path}']", text: 'Dashboard')
    expect(page).to have_selector(:css, "a[href='#{users_projects_path}']", text: 'Projetos')
  end

end
