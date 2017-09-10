class Objective < ApplicationRecord
  belongs_to :user
  belongs_to :okr
  has_many :key_results
  has_many :tasks, through: :key_results
  accepts_nested_attributes_for :key_results, reject_if: ->(a) { a[:name].blank? }, allow_destroy: true

  validates :name, presence: true

  scope :active, -> { where(is_deleted: false) }
end
