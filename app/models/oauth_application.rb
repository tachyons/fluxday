class OauthApplication < ApplicationRecord
  has_many :user_oauth_applications
  has_many :users, through: :user_oauth_applications
  scope :by_name, -> { order('oauth_applications.name ASC') }
end

# == Schema Information
# Schema version: 20160604102931
#
# Table name: oauth_applications
#
#  id           :integer          not null, primary key
#  name         :string           not null
#  uid          :string           not null, indexed
#  secret       :string           not null
#  redirect_uri :text             not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_oauth_applications_on_uid  (uid) UNIQUE
#
