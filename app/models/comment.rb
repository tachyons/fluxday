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

# == Schema Information
# Schema version: 20160604102931
#
# Table name: comments
#
#  id          :integer          not null, primary key
#  source_id   :integer
#  source_type :string
#  body        :text
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  is_deleted  :boolean          default(FALSE)
#  comment_id  :integer
#
