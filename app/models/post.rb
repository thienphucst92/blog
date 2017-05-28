class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
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

end
