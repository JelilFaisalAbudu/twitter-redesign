class Tweet < ApplicationRecord
  belongs_to :author, class_name: 'User'

  validates :text, presence: true, length: { maximum: 250, minimum: 5 }
end
