class Vote < ApplicationRecord
  has_many :tribe_votes
  has_many :tribes, through: :tribe_votes
end
