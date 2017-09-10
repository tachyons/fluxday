class TaskKeyResult < ApplicationRecord
  belongs_to :task
  belongs_to :key_result
end

# == Schema Information
# Schema version: 20160604102931
#
# Table name: task_key_results
#
#  id            :integer          not null, primary key
#  task_id       :integer
#  key_result_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
