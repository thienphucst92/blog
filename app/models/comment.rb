class Comment < ApplicationRecord
  belongs_to :post

  def created_by
    user = User.find(user_id)
    user.email
  end
end
