require 'rails_helper'

RSpec.feature "Board", type: :feature do
  before(:each) do
    @board = create(:board)
    login_as(@board.project.user, scope: :user)
  end

  it 'should have a link routing to the new board action' do
    visit users_project_path(@board.project)
    expect(page).to have_selector(:css, "a[href='#{new_users_project_board_path(@board.project)}']")
  end

  it 'should have a link to the edit board action' do
    visit users_project_path(@board.project)
    expect(page).to have_selector(:css, "a[href='#{edit_users_project_board_path(@board.project, @board)}']")
  end

  it 'should display a success message when a board is created' do
    visit new_users_project_board_path(@board.project)

    fill_in 'board_name', with: "Nome"
    fill_in 'board_position', with: 1

    click_button 'Salvar'

    expect(page.current_path).to eq users_project_path(@board.project)
    expect(page).to have_selector('div.alert.alert-info', text: 'Quadro criado com sucesso')

  end

  it 'should display a success message when a board is updated' do
    visit edit_users_project_board_path(@board.project, @board)

    expect(page).to have_selector("input[value='#{@board.name}']")

    fill_in 'board_name', with: "Quadro atualizado"
    fill_in 'board_position', with: 2

    expect do
      find('input[name="commit"]').click
    end.to change(Board, :count).by(0)

    expect(page.current_path).to eq users_project_path(@board.project)
    expect(page).to have_selector('div.alert.alert-info', text: 'Quadro atualizado com sucesso')

    visit edit_users_project_board_path(@board.project, @board)
    expect(page).to have_selector("input[value='Quadro atualizado']")
  end

=begin
  it 'should display a success message when a board is deleted', js: true do
    project = create(:project)
    login_as(project.user, scope: :user)

    visit users_project_path(project)

    find(".delete_board").find(".fa-trash").click
    page.accept_confirm{ click_button "Ok"}

    expect(page.current_path).to eq users_project_path(project)
    expect(page).to have_selector('div.alert.alert-info', text: 'Quadro excluido com sucesso')

  end
=end

end
