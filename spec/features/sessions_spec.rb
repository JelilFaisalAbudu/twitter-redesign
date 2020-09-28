require 'rails_helper'

RSpec.feature 'Sessions', type: :feature do
  let(:user) { FactoryBot.create(:user) }
  context "visit the webpage" do
    scenario 'should display the login page' do
      visit 'tweets/index'
      expect(page).to  have_content('Sign in')
    end

    scenario 'should not sign in unregistered user' do
      visit sign_in_path

      within('form') do
        fill_in "username",	with: "InvalidUserName" 
      end
      click_button 'Submit'
      expect(page).to  have_content('Invalid username. Try again')
    end

    scenario 'should sign in registered user' do
      visit sign_in_path

      within('form') do
        fill_in "username",	with: user.Username 
      end
      click_button 'Submit'
      expect(page).to  have_content('Start a new tweet')
    end
  end
end
