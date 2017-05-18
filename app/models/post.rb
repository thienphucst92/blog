class Post < ApplicationRecord
	def self.search(search)
		where("title || body ILIKE ?", "%#{search}%")
	end
end
