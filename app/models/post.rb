class Post < ApplicationRecord
  belongs_to :user
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags
  has_many :comments, dependent: :destroy

  validates :user, presence: true
  validates :title, presence: true,
    length: {maximum: Settings.micropost.max_title_length}
  validates :content, presence: true

  mount_uploader :picture, PostUploader

  scope :micropost_sort, ->{order created_at: :desc}
  scope :load_feed, lambda {|id, following_ids|
    where "user_id IN (#{following_ids}) OR user_id = :user_id",
      following_ids: following_ids, user_id: id
  }

  def all_tags
    tags.map(&:name).join ", "
  end

  def all_tags= names
    self.tags = names.split(",").map do |name|
      Tag.where(name: name.strip).first_or_create!
    end
  end
end
