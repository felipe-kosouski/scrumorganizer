require 'rails_helper'

RSpec.feature "Board", type: :feature do
  it 'should have a link routing to the new board action' do
    project = create(:project)

    visit users_project_path(project)
    expect(page).to have_selector(:css, "a[href='#{new_users_project_board_path(project)}']")

  end

  it 'should display a success message when a board is created' do
    project = create(:project)
    board = create(:board)

    visit new_users_project_board_path(project)

    fill_in 'board_name', with: board.name
    fill_in 'board_position', with: board.position

    click_button 'Salvar'

    expect(page.current_path).to eq users_project_path(project)
    expect(page).to have_selector('div.alert.alert-info', text: 'Quadro criado com sucesso')

  end

  it 'should access users root path and find menu links' do
    user = create(:user)
    login_as(user, scope: :user)
    visit users_root_path
    expect(page).to have_selector(:css, "a[href='#{users_root_path}']", text: 'Dashboard')
    expect(page).to have_selector(:css, "a[href='#{users_projects_path}']", text: 'Projetos')
  end

end
