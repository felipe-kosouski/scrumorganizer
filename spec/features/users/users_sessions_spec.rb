require 'rails_helper'

RSpec.feature "Users::Sessions", type: :feature do
  it "should display the user's profile links after successful login" do
    user = create(:user)
    visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: 'password'

    click_button 'Entrar'

    expect(page.current_path).to eq users_root_path
    expect(page).to have_selector('a', text: 'Meu perfil')
    expect(page).to have_selector('div.alert.alert-info', text: 'Logado com sucesso')
  end

  it "should display the user's error message when user or password is wrong" do
    user = create(:user)
    visit new_user_session_path

    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: 'passworda'

    click_button 'Entrar'

    expect(page.current_path).to eq new_user_session_path
    expect(page).to have_selector('div.alert.alert-warning', text: 'Email ou senha inválida.')
  end

  it 'should display success logout message when the user click on logout' do
    user = create(:user)
    login_as(user, scope: :user)

    visit users_root_path
    expect(page).to have_selector('a', text: 'Meu perfil')
    expect(page).to have_selector('a', text: 'Sair')

    click_link('Sair')
    expect(page.current_path).to eq root_path
    expect(page).to have_selector('div.alert.alert-info', text: 'Saiu com sucesso')
  end

  context "Register a user" do
    it 'should register a user with success when the data are valid' do
      user = build(:user)

      visit new_user_registration_path
      fill_in 'user_name', with: user.name
      fill_in 'user_username', with: user.username
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
      fill_in 'user_password_confirmation', with: user.password

      expect do
        find('input[name="commit"]').click
      end.to change(User, :count).by(1)

      expect(page.current_path).to eq users_root_path
      expect(page).to have_selector('div.alert.alert-info', text: 'Bem-vindo! Você se registrou com êxito.')
    end

    it 'should not register a user with invalid data and must show a error message' do
      visit new_user_registration_path

      fill_in 'user_name', with: " "
      fill_in 'user_username', with: "_.user..12"
      fill_in 'user_email', with: "email.com.br"
      fill_in 'user_password', with: "1234"
      fill_in 'user_password_confirmation', with: "1234"

      expect do
        find('input[name="commit"]').click
      end.to change(User, :count).by(0)

      expect(page).to have_selector('div.alert.alert-danger',
                                    text: 'Alguns erros foram encontrados, por favor verifique:')
      within('div.user_name') do
        expect(page).to have_content('não pode ficar em branco')
      end

      within('div.user_username') do
        expect(page).to have_content('Somente letras, numeros e simbolos (. _ -)')
      end

      within('div.user_email') do
        expect(page).to have_content('não é válido')
      end

      within('div.user_password') do
        expect(page).to have_content('é muito curto (mínimo: 6 caracteres)')
      end
      
    end
  end
  
  context "Edit a user" do
    it 'should edit a user with success when the data are valid' do
      user = create(:user)
      login_as(user, scope: :user)

      visit edit_user_registration_path

      expect(page).to have_selector("input[value='#{user.name}']")
      expect(page).to have_selector("input[value='#{user.username}']")
      expect(page).to have_selector("input[value='#{user.email}']")

      fill_in 'user_name', with: "Felipe Teste"
      fill_in 'user_password', with: "qwerty"
      fill_in 'user_password_confirmation', with: "qwerty"
      fill_in 'user_current_password',with: user.password

      expect do
        find('input[name="commit"]').click
      end.to change(User, :count).by(0)

      expect(page.current_path).to eq root_path
      expect(page).to have_selector('div.alert.alert-info', text: 'Sua conta foi atualizada com sucesso.')

      visit edit_user_registration_path
      expect(page).to have_selector("input[value='Felipe Teste']")
      expect(page).to have_selector("input[value='#{user.username}']")
      expect(page).to have_selector("input[value='#{user.email}']")
    end
  end
end
