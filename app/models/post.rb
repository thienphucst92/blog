class Post < ApplicationRecord
  has_many :comments, dependent: :destroy

	def self.search(search)
		where("title || body ILIKE ?", "%#{search}%")
	end
end
