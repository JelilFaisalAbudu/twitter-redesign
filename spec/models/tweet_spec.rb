require 'rails_helper'

RSpec.describe Tweet, type: :model do
  context "Every properly written tweet" do
    user = User.create(Username: 'JohnDoe',
      FullName: 'John Doe',
      Photo: 'photo.jpg',
      CoverImage: 'image.jpg'
    )
    it "has the presence of text" do
      tweet = user.tweets.build(Text: 'Lorem ipsum')
      expect(tweet).to  be_valid
    end
  end

  context "Every properly written tweet" do
    user = User.create(Username: 'JohnDoe',
      FullName: 'John Doe',
      Photo: 'photo.jpg',
      CoverImage: 'image.jpg'
    )
    it "has the presence of text" do
      tweet = user.tweets.build(Text: nil)
      expect(tweet).not_to  be_valid
    end
  end
  
  context 'ActiveRecord associations' do
    it 'belongs to author' do
      user = Tweet.reflect_on_association(:Author)
      expect(user.macro).to eq(:belongs_to)
    end
  end
  
end
