class Project < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_many :teams
  has_many :tasks
  has_many :project_managers
  has_many :users, through: :project_managers, after_remove: :update_user_project_count
  has_many :team_members, through: :teams
  has_many :project_members, through: :team_members, source: :user
  scope :active, -> { where(is_deleted: false) }

  validates :name, :code, presence: true
  validates :code, uniqueness: true

  # default_scope where(is_deleted: false)
  default_scope { order('projects.name ASC') }

  # after_save  :update_numbers

  def members
    project_members.active.uniq
  end

  def update_user_project_count(pm)
    pm.update_attributes(admin_projects_count: pm.projects.count)
  end

  def update_numbers
    update_attributes(team_count: teams.count)
  end

  def destroy
    if update_attribute(:is_deleted, true)
      teams.update_all(is_deleted: true)
      teams.update_all(is_deleted: true)
      tasks.update_all(is_deleted: true)
      team_members.update_all(status: 'archived')
      project_managers.update_all(status: 'archived')
    end
  end
end

# == Schema Information
# Schema version: 20160604102931
#
# Table name: projects
#
#  id           :integer          not null, primary key
#  name         :string
#  code         :string
#  description  :text
#  is_deleted   :boolean          default(FALSE)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  team_count   :integer          default(0)
#  member_count :integer          default(0)
#  website      :string
#  image        :string
#
