class KeyResult < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :objective
  # has_many :tasks
  has_many :task_key_results
  has_many :tasks, through: :task_key_results
  has_many :work_logs, through: :tasks
  scope :active, -> { where(is_deleted: false) }

  validates :name, presence: true
end

# == Schema Information
# Schema version: 20160604102931
#
# Table name: key_results
#
#  id           :integer          not null, primary key
#  name         :text
#  user_id      :integer
#  objective_id :integer
#  author_id    :integer
#  start_date   :date
#  end_date     :date
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  is_deleted   :boolean          default(FALSE)
#
