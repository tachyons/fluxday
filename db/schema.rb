# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_160_604_102_931) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'comments', force: :cascade do |t|
    t.integer 'source_id'
    t.string 'source_type'
    t.text 'body'
    t.integer 'user_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.boolean 'is_deleted', default: false
    t.integer 'comment_id'
  end

  create_table 'friendly_id_slugs', force: :cascade do |t|
    t.string 'slug', null: false
    t.integer 'sluggable_id', null: false
    t.string 'sluggable_type', limit: 50
    t.string 'scope'
    t.datetime 'created_at'
    t.index %w[slug sluggable_type scope], name: 'index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope', unique: true
    t.index %w[slug sluggable_type], name: 'index_friendly_id_slugs_on_slug_and_sluggable_type'
    t.index ['sluggable_id'], name: 'index_friendly_id_slugs_on_sluggable_id'
    t.index ['sluggable_type'], name: 'index_friendly_id_slugs_on_sluggable_type'
  end

  create_table 'key_results', force: :cascade do |t|
    t.text 'name'
    t.integer 'user_id'
    t.integer 'objective_id'
    t.integer 'author_id'
    t.date 'start_date'
    t.date 'end_date'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.boolean 'is_deleted', default: false
  end

  create_table 'oauth_access_grants', force: :cascade do |t|
    t.integer 'resource_owner_id', null: false
    t.integer 'application_id', null: false
    t.string 'token', null: false
    t.integer 'expires_in', null: false
    t.text 'redirect_uri', null: false
    t.datetime 'created_at', null: false
    t.datetime 'revoked_at'
    t.string 'scopes'
    t.index ['token'], name: 'index_oauth_access_grants_on_token', unique: true
  end

  create_table 'oauth_access_tokens', force: :cascade do |t|
    t.integer 'resource_owner_id'
    t.integer 'application_id'
    t.string 'token', null: false
    t.string 'refresh_token'
    t.integer 'expires_in'
    t.datetime 'revoked_at'
    t.datetime 'created_at', null: false
    t.string 'scopes'
    t.index ['refresh_token'], name: 'index_oauth_access_tokens_on_refresh_token', unique: true
    t.index ['resource_owner_id'], name: 'index_oauth_access_tokens_on_resource_owner_id'
    t.index ['token'], name: 'index_oauth_access_tokens_on_token', unique: true
  end

  create_table 'oauth_applications', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'uid', null: false
    t.string 'secret', null: false
    t.text 'redirect_uri', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['uid'], name: 'index_oauth_applications_on_uid', unique: true
  end

  create_table 'objectives', force: :cascade do |t|
    t.text 'name'
    t.integer 'user_id'
    t.integer 'author_id'
    t.date 'start_date'
    t.date 'end_date'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.boolean 'is_deleted', default: false
    t.integer 'okr_id'
  end

  create_table 'okrs', force: :cascade do |t|
    t.integer 'user_id'
    t.string 'name'
    t.date 'start_date'
    t.date 'end_date'
    t.boolean 'is_deleted', default: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.boolean 'approved', default: false
  end

  create_table 'project_managers', force: :cascade do |t|
    t.integer 'project_id'
    t.integer 'user_id'
    t.string 'status', default: 'active'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'projects', force: :cascade do |t|
    t.string 'name'
    t.string 'code'
    t.text 'description'
    t.boolean 'is_deleted', default: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'team_count', default: 0
    t.integer 'member_count', default: 0
    t.string 'website'
    t.string 'image'
  end

  create_table 'reporting_managers', force: :cascade do |t|
    t.integer 'user_id'
    t.integer 'manager_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'status', default: 'active'
  end

  create_table 'task_assignees', force: :cascade do |t|
    t.integer 'task_id'
    t.integer 'user_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'status', default: 'active'
  end

  create_table 'task_key_results', force: :cascade do |t|
    t.integer 'task_id'
    t.integer 'key_result_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'tasks', force: :cascade do |t|
    t.string 'name'
    t.text 'description'
    t.datetime 'start_date'
    t.datetime 'end_date'
    t.integer 'project_id'
    t.integer 'team_id'
    t.integer 'user_id'
    t.string 'tracker_id'
    t.integer 'comments_count', default: 0
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'priority'
    t.boolean 'is_deleted', default: false
    t.integer 'task_id'
    t.string 'status', default: 'active'
    t.datetime 'completed_on'
  end

  create_table 'team_members', force: :cascade do |t|
    t.integer 'team_id'
    t.integer 'user_id'
    t.string 'role', default: 'member'
    t.string 'status', default: 'active'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'teams', force: :cascade do |t|
    t.string 'name'
    t.string 'code'
    t.text 'description'
    t.integer 'project_id'
    t.integer 'members_count', default: 0
    t.integer 'managers_count', default: 0
    t.boolean 'is_deleted', default: false
    t.integer 'pending_tasks'
    t.string 'status', default: 'active'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'user_oauth_applications', force: :cascade do |t|
    t.bigint 'user_id'
    t.bigint 'oauth_application_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['oauth_application_id'], name: 'index_user_oauth_applications_on_oauth_application_id'
    t.index ['user_id'], name: 'index_user_oauth_applications_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.integer 'sign_in_count', default: 0, null: false
    t.datetime 'current_sign_in_at'
    t.datetime 'last_sign_in_at'
    t.string 'current_sign_in_ip'
    t.string 'last_sign_in_ip'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'image'
    t.string 'name'
    t.string 'nickname'
    t.string 'employee_code'
    t.datetime 'joining_date'
    t.string 'role'
    t.string 'status', default: 'active'
    t.boolean 'is_deleted', default: false
    t.string 'provider'
    t.string 'uid'
    t.integer 'admin_teams_count', default: 0
    t.integer 'admin_projects_count', default: 0
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  create_table 'work_logs', force: :cascade do |t|
    t.integer 'user_id'
    t.string 'name'
    t.time 'start_time'
    t.time 'end_time'
    t.date 'date'
    t.boolean 'is_deleted', default: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'task_id'
    t.integer 'minutes'
    t.text 'description'
    t.boolean 'delete_request', default: false
  end
end
