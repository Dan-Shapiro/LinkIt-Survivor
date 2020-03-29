class Vote < ApplicationRecord
  has_many :tribe_votes, dependent: :delete_all
  has_many :tribes, through: :tribe_votes

  belongs_to :tribe

  has_many :polls, dependent: :delete_all
end
