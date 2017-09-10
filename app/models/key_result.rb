class KeyResult < ApplicationRecord
  belongs_to :user
  belongs_to :objective
  # has_many :tasks
  has_many :task_key_results
  has_many :tasks, through: :task_key_results
  has_many :work_logs, through: :tasks
  scope :active, -> { where(is_deleted: false) }

  validates :name, presence: true
end
