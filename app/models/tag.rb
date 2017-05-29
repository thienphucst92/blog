require 'set'
class Tag < ApplicationRecord
  has_and_belongs_to_many :posts

  def self.search(search)
		tags = where("name ILIKE ?", "%#{search}%")
    posts = Set.new
    tags.each do |tag|
      posts.merge(tag.posts)
    end
    posts.to_a
	end
end
