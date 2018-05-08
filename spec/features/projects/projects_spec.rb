require 'rails_helper'

RSpec.feature "Projects", type: :feature do
  it 'should access projects index and see all projects' do
    user = create(:user)
    login_as(user, scope: :user)
    project = create(:project)
    visit users_projects_path
    expect(page).to have_selector('th', text: 'Nome')
    expect(page).to have_selector('th', text: 'Usuario Responsavel')
    expect(page).to have_selector('th', text: 'Açoes')

    expect(page).to have_selector('td', text: project.name)
    expect(page).to have_selector('td', text: project.user.name)
  end

  it 'should see sidebar' do
    user = create(:user)
    login_as(user, scope: :user)
    visit users_projects_path
    expect(page).to have_selector('div.profile-sidebar')
  end


   it 'should create a project with success when the data are valid' do
     user = create(:user)
     login_as(user, scope: :user)
     project = create(:project)

     visit new_users_project_path
     fill_in 'project_name', with: project.name

     expect do
       find('input[name="commit"]').click
     end.to change(Project, :count).by(1)

     expect(page.current_path).to eq users_project_path
     expect(page).to have_selector('div.alert.alert-info', text: 'Projeto criado com sucesso')
   end


=begin
  it 'should delete a project' do
    user = create(:user)
    login_as(user, scope: :user)
    project = create(:project)
    visit users_projects_path

    expect do
      click_link ?????
    end
  end
=end
  
end
