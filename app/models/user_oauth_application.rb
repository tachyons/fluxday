class UserOauthApplication < ApplicationRecord
  belongs_to :user
  belongs_to :oauth_application
end

# == Schema Information
# Schema version: 20160604102931
#
# Table name: user_oauth_applications
#
#  id                   :integer          not null, primary key
#  user_id              :integer          indexed
#  oauth_application_id :integer          indexed
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
# Indexes
#
#  index_user_oauth_applications_on_oauth_application_id  (oauth_application_id)
#  index_user_oauth_applications_on_user_id               (user_id)
#
