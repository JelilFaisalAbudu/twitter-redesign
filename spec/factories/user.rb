FactoryBot.define do
  factory :user do
    Username { 'JaneDoe' }
    FullName { 'Jane Doe' }
    Photo { 'photo.jpg' }
    CoverImage { 'coverImage.jpg' }
  end
end
