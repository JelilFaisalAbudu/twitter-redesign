require 'rails_helper'

RSpec.feature 'Users', type: :feature do
  let(:jane) do
    FactoryBot.create(:user)
  end
  
  let(:john) do
    User.create(
      Username: 'JohnDoe',
      FullName: 'John Doe',
      Photo: 'photo.jpg',
      CoverImage: 'coverImage.jpg'
    )
  end

  before do
    visit sign_in_path

    within('form') do
      fill_in "username",	with: jane.Username 
    end
    click_button 'Submit'
  end

  scenario 'as new newly registered have no followers' do
    expect(jane.followers.count).to eq(0) 
  end

  scenario 'as new newly registered have no following' do
    expect(jane.following.count).to eq(0) 
  end

  scenario 'as new newly registered can follow other users' do
     jane.active_relationships.create(Followed_id: john.id)
     expect(jane.following.count).to  eq(1)
     expect(john.followers.count).to  eq(1)
  end

end
