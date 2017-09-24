class TeamMember < ApplicationRecord
  belongs_to :team, optional: true
  belongs_to :user

  # validates :team_id, uniqueness: {scope: :user_id}

  default_scope { where.not(status: 'archived') }

  after_save :update_member_counts

  def update_member_counts
    user.update_attributes(admin_teams_count: user.admin_teams.count) if role == 'lead'
    team.update_attributes(members_count: team.users.active.count, managers_count: team.team_leads.active.count)
    team.project.update_attributes(member_count: team.project.project_members.active.count)
  end
end

# == Schema Information
# Schema version: 20160604102931
#
# Table name: team_members
#
#  id         :integer          not null, primary key
#  team_id    :integer
#  user_id    :integer
#  role       :string           default("member")
#  status     :string           default("active")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
