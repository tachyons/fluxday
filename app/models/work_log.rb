class WorkLog < ApplicationRecord
  belongs_to :user
  belongs_to :task

  validates :task_id, presence: true
  # validates_inclusion_of :date, :in => 6.day.ago..Date.today,:message=>'Date should be older than 5 days'
  validates :date, inclusion: { in: proc { 6.days.ago..Date.current }, message: 'Date should be older than 5 days' }
  # default_scope{ where.not(is_deleted: true) }

  scope :active, -> { where(is_deleted: false) }

  def self.user_logs_dated(user, _date)
    user.work_logs.find_by(date: Date.current)
  end

  def hours
    "#{minutes.to_i / 60}:#{format('%02d', (minutes.to_i % 60))}"
  end
end

# == Schema Information
# Schema version: 20160604102931
#
# Table name: work_logs
#
#  id             :integer          not null, primary key
#  user_id        :integer
#  name           :string
#  start_time     :time
#  end_time       :time
#  date           :date
#  is_deleted     :boolean          default(FALSE)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  task_id        :integer
#  minutes        :integer
#  description    :text
#  delete_request :boolean          default(FALSE)
#
