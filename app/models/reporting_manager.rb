class ReportingManager < ApplicationRecord
  belongs_to :user
  belongs_to :manager, class_name: 'User'
  default_scope { where.not(status: 'archived') }
end

# == Schema Information
# Schema version: 20160604102931
#
# Table name: reporting_managers
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  manager_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  status     :string           default("active")
#
