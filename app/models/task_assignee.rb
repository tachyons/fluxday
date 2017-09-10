class TaskAssignee < ApplicationRecord
  belongs_to :task
  belongs_to :user

  default_scope { where.not(status: 'archived') }
end

# == Schema Information
# Schema version: 20160604102931
#
# Table name: task_assignees
#
#  id         :integer          not null, primary key
#  task_id    :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  status     :string           default("active")
#
