require 'rails_helper'

RSpec.describe Following, type: :model do

  context 'ActiveRecord associations' do
    it 'belongs to follower' do
      user = Following.reflect_on_association(:Follower)
      expect(user.macro).to eq(:belongs_to)
    end

    it 'belongs to followed' do
      user = Following.reflect_on_association(:Followed)
      expect(user.macro).to eq(:belongs_to)
    end
  end

  context 'Attributes Validation' do
      
      user_one = User.create(Username: 'JaneDoe',
        FullName: 'Jane Doe',
        Photo: 'photo.jpg',
        CoverImage: 'image.jpg'
      )
  
      user_two = User.create(Username: 'JohnDoe',
        FullName: 'John Doe',
        Photo: 'photo.jpg',
        CoverImage: 'image.jpg'
      )

    following = user_one.active_relationships.build(Followed_id: nil)

    it 'should invalidate the Followed_id of value nil' do
      expect(following).to_not be_valid
    end
  end
end
