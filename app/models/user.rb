class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # :rememberable, :registerable, :recoverable
  devise :database_authenticatable, :validatable

  belongs_to :tribe

  has_many :polls
end
