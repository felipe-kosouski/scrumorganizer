require 'rails_helper'

RSpec.feature "Roles", type: :role do


  it 'should create a project and set user as manager' do
    user = create(:user)
    login_as(user, scope: :user)
    project = create(:project)

    visit new_users_project_path
    fill_in 'project_name', with: project.name

    find('input[name="commit"]').click
    expect(user).to have_role(:manager, project)

    expect(page.current_path).to eq users_project_path
    expect(page).to have_selector('div.alert.alert-info', text: 'Projeto criado com sucesso')
  end

end
