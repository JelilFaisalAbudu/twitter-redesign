require 'rails_helper'

RSpec.describe User, type: :model do
  context 'ActiveRecord associations' do
    it 'belongs to author' do
      user = User.reflect_on_association(:tweets)
      expect(user.macro).to eq(:has_many)
    end
  end

  context 'Every available user' do
    user = User.new(
      username: 'ExampleUser',
      full_name: 'Example User'
      # photo: 'photo.jpg',
      # cover_image: 'image.jpg'
    )

    it 'has both username full name' do
      expect(user).to be_valid
    end

    it 'has both username full name' do
      user.username = nil
      expect(user).not_to be_valid
    end
  end
end
