class Post < ApplicationRecord
  belongs_to :user
  
  validates :user_id, presence: true
  validates :image, presence: true
  validates :caption, presence: true
  
  has_attached_file :image, styles: { medium: "640x" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  
end