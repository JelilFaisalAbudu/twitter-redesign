require 'rails_helper'

RSpec.feature 'Tweets', type: :feature do
  let(:user) { FactoryBot.create(:user) }
  # let(:tweet) do
  #   user.tweets.build(Text: 'Lorem Ipsum, lorem ipsum')
  # end

  scenario 'cannot be posted  with empty text' do
    visit sign_in_path
    within('#sign-in-form') do
      fill_in 'username',	with: user.Username
    end
    click_button 'Submit'
    expect(page).to have_content('Start a new tweet')

    within('#tweet-form') do
      fill_in 'tweetFormControlTextarea',	with: ' '
    end
    click_button 'Send'
    expect(page).to  have_content('Error. Tweet cannot be empty. You can only tweet with ten or more characters.')
  end

  scenario 'cannot be posted  with empty text' do
    visit sign_in_path
    within('#sign-in-form') do
      fill_in 'username',	with: user.Username
    end
    click_button 'Submit'
    expect(page).to have_content('Start a new tweet')

    within('#tweet-form') do
      fill_in 'tweetFormControlTextarea',	with: 'Lorem Ipsum, lorem ipsum'
    end
    click_button 'Send'
    expect(page).to have_content('Your tweet was successfully posted.')
  end
end
