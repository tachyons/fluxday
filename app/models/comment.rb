class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :source, polymorphic: true
  scope :active, -> { where(is_deleted: false) }

  validates :user_id, :body, :source, presence: true

  after_save :update_comment_count
  # default_scope where(is_deleted: false)

  def update_comment_count
    source.update_attributes(comments_count: source.comments.active.count)
  end
end
