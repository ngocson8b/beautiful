class Post < ActiveRecord::Base
  belongs_to :user
  has_many :likes
  has_many :post_comment, -> { order "created_at DESC"}
  has_attached_file :image, styles: { medium: "500x500>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
