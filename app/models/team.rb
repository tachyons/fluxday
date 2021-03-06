class Team < ApplicationRecord
  belongs_to :project
  has_many :team_members, -> { where(role: 'member') }
  has_many :tasks
  has_many :users, through: :team_members
  has_many :okrs, through: :users
  has_many :key_results, through: :okrs
  has_many :leads, -> { where role: 'lead' }, class_name: 'TeamMember'
  has_many :team_leads, through: :leads, source: :user # ,:foreign_key=>'user_id'
  has_many :members, through: :team_members, source: :user

  validates :name, :code, :project_id, presence: true

  default_scope { where.not(is_deleted: true).order('teams.name ASC') }

  scope :active, -> { where(status: 'active') }

  after_save :update_project_team_count

  def update_project_team_count
    project.update_attributes(team_count: project.teams.active.count)
  end

  def self.for_user(user)
    teams = Team.where('project_id IN (?) OR id IN (?)', user.project_ids, (user.admin_team_ids + user.team_ids).uniq)
  end

  def self.admind_by_user(user)
    teams = Team.where('project_id IN (?) OR id IN (?)', user.project_ids, user.admin_team_ids.uniq)
  end

  def self.assignable_by_user(user)
    teams = Team.where(project_id: (user.project_ids + user.admin_teams.collect(&:project_id).uniq))
  end
end

# == Schema Information
# Schema version: 20160604102931
#
# Table name: teams
#
#  id             :integer          not null, primary key
#  name           :string
#  code           :string
#  description    :text
#  project_id     :integer
#  members_count  :integer          default(0)
#  managers_count :integer          default(0)
#  is_deleted     :boolean          default(FALSE)
#  pending_tasks  :integer
#  status         :string           default("active")
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
