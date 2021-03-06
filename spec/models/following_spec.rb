require 'rails_helper'

RSpec.describe Following, type: :model do
  context 'ActiveRecord associations' do
    it 'belongs to follower' do
      user = Following.reflect_on_association(:follower)
      expect(user.macro).to eq(:belongs_to)
    end

    it 'belongs to followed' do
      user = Following.reflect_on_association(:followed)
      expect(user.macro).to eq(:belongs_to)
    end
  end

  context 'Attributes Validation' do
    user_one = User.create(username: 'JaneDoe',
                           full_name: 'Jane Doe')
    #  photo: 'photo.jpg',
    #  cover_image: 'image.jpg'

    following = user_one.active_relationships.build(followed_id: nil)

    it 'should invalidate the followed_id of value nil' do
      expect(following).to_not be_valid
    end
  end
end
