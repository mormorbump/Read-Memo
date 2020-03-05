# frozen_string_literal: true

class Post < ApplicationRecord
  mount_uploader :image, ImageUploader

  validates :title, { presence: true }
  validates :content, { presence: true }
  validates :user_id, { presence: true }

  belongs_to :user

  def user
    User.find_by(id: user_id)
  end
end
