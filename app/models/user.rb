class User < ApplicationRecord
  has_secure_password

  mount_uploader :image,ImageUploader

  validates :email, {presence: true}
  validates :password, {presence: true}

  has_many :posts, dependent: :destroy

  def posts
    return Post.where(user_id: self.id)
  end

  paginates_per 8

end
