class Post < ApplicationRecord
	extend FriendlyId
	friendly_id :title, use: :slugged
	validates_presence_of :title, :content, :slug
end
