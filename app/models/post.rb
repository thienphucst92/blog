class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_and_belongs_to_many :tags
  belongs_to :user
  validates :title, presence: true
  validates :body, presence: true

	def self.search(search)
		where("title || body ILIKE ?", "%#{search}%")
	end

  def created_by
    user = User.find(user_id)
    user.email
  end

  def tag_list
    self.tags.map { |t| t.name }.join(', ')
  end

  def tag_list=(tag_list)
    self.tags.clear # For the update method, just in case we're changing tags

    # Split the tags into an array, strip whitespace , and convert to lowercase
    tags = tag_list.split(",").collect{|s| s.strip.downcase}

    # For each tag, find or create by name, and associate with the post
    tags.each do |tag_name|
      tag = Tag.find_or_create_by(name: tag_name)
      tag.name = tag_name
      self.tags << tag # Append the tag to the post
    end
  end
end
