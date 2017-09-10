class Okr < ApplicationRecord
  belongs_to :user
  has_many :objectives
  has_many :key_results, through: :objectives
  accepts_nested_attributes_for :objectives, reject_if: ->(a) { a[:name].blank? }, allow_destroy: true

  after_save :update_children

  validates :name, :user_id, :start_date, :end_date, presence: true

  scope :active, -> { where(is_deleted: false) }
  scope :approved, -> { where(approved: true) }

  def update_children
    objectives.update_all(user_id: user_id, start_date: start_date, end_date: end_date)
    key_results.update_all(user_id: user_id, start_date: start_date, end_date: end_date)
  end
end
