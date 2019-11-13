class Post < ApplicationRecord
  belongs_to :admin_user
  validates :title, :body, presence: true

  has_attached_file :image
  validates_attachment_content_type :image,
                                     content_type: /^image\/(jpg|jpeg|pjpeg|png|x-png|gif)$/,
                                     message: 'file type is not allowed (only jpeg/png/gif images)'
end
