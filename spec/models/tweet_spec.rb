require 'rails_helper'

RSpec.describe Tweet, type: :model do

  let(:user) { FactoryBot.create(:user) }

  context "Every properly written tweet" do
    it "has the presence of text" do
      tweet = user.tweets.build(Text: 'Lorem ipsum')
      expect(tweet).to  be_valid
    end
  end

  context "Every properly written tweet" do
    
    it "has the presence of text" do
      tweet = user.tweets.build(Text: nil)
      expect(tweet).not_to  be_valid
    end
  end
  
  context 'ActiveRecord associations' do
    it 'belongs to author' do
      tweet = Tweet.reflect_on_association(:Author)
      expect(tweet.macro).to eq(:belongs_to)
    end
  end
  
end
