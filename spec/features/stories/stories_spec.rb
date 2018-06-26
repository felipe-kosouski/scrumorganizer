require 'rails_helper'

RSpec.feature "Story", type: :feature do
  before(:each) do
    @story = create(:story)
    login_as(@story.board.project.user, scope: :user)
  end

  it 'should have a link routing to the new story action' do
    visit users_project_path(@story.board.project)
    expect(page).to have_selector(:css, "a[href='#{new_users_project_board_story_path(@story.board.project, @story.board)}']")
  end

  it 'should have a link to the edit story action' do
    visit users_project_path(@story.board.project)
    expect(page).to have_selector(:css, "a[href='#{edit_users_project_board_story_path(@story.board.project, @story.board, @story)}']")
  end

  it 'should display a success message when a story is created' do
    visit new_users_project_board_story_path(@story.board.project, @story.board)

    fill_in 'story_name', with: "Lorem Ipsum"

    click_button 'Salvar'

    expect(page.current_path).to eq users_project_path(@story.board.project)
    expect(page).to have_selector('div.alert.alert-info', text: 'Estoria criada com sucesso')

  end

  it 'should display a success message when a story is updated' do
    visit edit_users_project_board_story_path(@story.board.project, @story.board, @story)

    expect(page).to have_selector("input[value='#{@story.name}']")

    fill_in 'story_name', with: "Lorem Ipsum atualizado"

    expect do
      find('input[name="commit"]').click
    end.to change(Story, :count).by(0)

    expect(page.current_path).to eq users_project_path(@story.board.project)
    expect(page).to have_selector('div.alert.alert-info', text: 'Estoria atualizada com sucesso')

    visit edit_users_project_board_story_path(@story.board.project, @story.board, @story)
    expect(page).to have_selector("input[value='Lorem Ipsum atualizado']")
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
