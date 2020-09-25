class User < ApplicationRecord
	has_many :tweets, foreign_key: :Author_id
end
