class Tribe < ApplicationRecord
	has_many :users

	has_many :tribe_votes
	has_many :votes, through: :tribe_votes

	has_many :votes
end
