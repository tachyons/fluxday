class Objective < ApplicationRecord
  belongs_to :user
  belongs_to :okr
  has_many :key_results
  has_many :tasks, through: :key_results
  accepts_nested_attributes_for :key_results, reject_if: ->(a) { a[:name].blank? }, allow_destroy: true

  validates :name, presence: true

  scope :active, -> { where(is_deleted: false) }
end

# == Schema Information
# Schema version: 20160604102931
#
# Table name: objectives
#
#  id         :integer          not null, primary key
#  name       :text
#  user_id    :integer
#  author_id  :integer
#  start_date :date
#  end_date   :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  is_deleted :boolean          default(FALSE)
#  okr_id     :integer
#
