class Tweet < ApplicationRecord
	belongs_to :Author, class_name: "User"
end
