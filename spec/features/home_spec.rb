require 'rails_helper'

RSpec.feature "Home", type: :feature do
  describe "GET /" do
    it 'should access root path and find links' do
      visit root_path
      expect(page).to have_selector(:css, "a[href='#{root_path}']", text: 'Scrum Organizer')
      expect(page).to have_selector(:css, "a[href='#{new_user_registration_path}']", text: 'Registrar')
      expect(page).to have_selector(:css, "a[href='#{new_user_session_path}']", text: 'Entrar')
      expect(page).to have_selector(:css, 'a[href="#"]', text: 'Saiba Mais')
    end
  end
end
