class Tweet < ApplicationRecord
  belongs_to :Author, class_name: 'User'

  validates :Text, presence: true, length: {maximum: 250, minimum: 5}
  
  
end
