require 'rails_helper'

RSpec.feature "Board", type: :feature do
  it 'should have a link routing to the new board action' do
    project = create(:project)
    login_as(project.user, scope: :user)

    visit users_project_path(project)
    expect(page).to have_selector(:css, "a[href='#{new_users_project_board_path(project)}']")

  end

  it 'should display a success message when a board is created' do
    project = create(:project)
    login_as(project.user, scope: :user)

    visit new_users_project_board_path(project)

    fill_in 'board_name', with: "Nome"
    fill_in 'board_position', with: 1

    click_button 'Salvar'

    expect(page.current_path).to eq users_project_path(project)
    expect(page).to have_selector('div.alert.alert-info', text: 'Quadro criado com sucesso')

  end

end
