require 'rails_helper'

RSpec.feature "Projects", type: :feature do
  before(:each) do
    @project = create(:project)
    login_as(@project.user, scope: :user)
  end

  it 'should access projects index and see all projects' do
    visit users_projects_path
    expect(page).to have_selector('th', text: 'Nome')
    expect(page).to have_selector('th', text: 'Usuario Responsavel')
    expect(page).to have_selector('th', text: 'Açoes')

    expect(page).to have_selector('td', text: @project.name)
    expect(page).to have_selector('td', text: @project.user.name)
  end

  it 'should see sidebar' do
    visit users_projects_path
    expect(page).to have_selector('div.profile-sidebar')
  end

  it 'should create a project with success when the data are valid' do
    visit new_users_project_path
    fill_in 'project_name', with: @project.name

    expect do
      find('input[name="commit"]').click
    end.to change(Project, :count).by(1)

    expect(page.current_path).to eq users_project_path(@project.id + 1)
    expect(page).to have_selector('div.alert.alert-info', text: 'Projeto criado com sucesso')
  end

  it 'should set user as manager when a project is created' do
    @project.user.add_role :manager, @project
    expect(@project.user.has_role? :manager, @project).to be true
  end

  it 'should edit a project with sucess when the data are valid' do
    visit edit_users_project_path(@project)

    expect(page).to have_selector("input[value='#{@project.name}']")

    fill_in 'project_name', with: "Projeto Atualizado"

    expect do
      find('input[name="commit"]').click
    end.to change(Project, :count).by(0)

    expect(page.current_path).to eq users_project_path(@project)
    expect(page).to have_selector('div.alert.alert-info', text: 'Projeto atualizado com sucesso')

    visit edit_users_project_path(@project)
    expect(page).to have_selector("input[value='Projeto Atualizado']")
  end



=begin
  it 'should delete a project', js: true do
    visit users_projects_path

    expect do
      page.evaluate_script('window.confirm = function() { return true; }')
    end.to change(Project, :count).by(-1)
  end
=end
  
end
