class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :user

	def self.search(search)
		where("title || body ILIKE ?", "%#{search}%")
	end
end
