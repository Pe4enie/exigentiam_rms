# encoding: UTF-8
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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130520221629) do

  create_table "artifact_statuses", :force => true do |t|
    t.integer  "project_id"
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "artifact_statuses", ["project_id"], :name => "index_artifact_statuses_on_project_id"

  create_table "artifact_types", :force => true do |t|
    t.integer  "project_id"
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "shortening"
  end

  add_index "artifact_types", ["project_id"], :name => "index_artifact_types_on_project_id"

  create_table "artifacts", :force => true do |t|
    t.integer  "project_id"
    t.integer  "parent_id"
    t.integer  "assignee_id"
    t.text     "description"
    t.string   "identifier"
    t.integer  "artifact_type_id"
    t.integer  "artifact_status_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "artifacts", ["artifact_status_id"], :name => "index_artifacts_on_artifact_status_id"
  add_index "artifacts", ["artifact_type_id"], :name => "index_artifacts_on_artifact_type_id"
  add_index "artifacts", ["assignee_id"], :name => "index_artifacts_on_assignee_id"
  add_index "artifacts", ["parent_id"], :name => "index_artifacts_on_parent_id"
  add_index "artifacts", ["project_id"], :name => "index_artifacts_on_project_id"

  create_table "changes", :force => true do |t|
    t.integer  "project_id"
    t.integer  "artifact_id"
    t.integer  "changer_id"
    t.integer  "version"
    t.text     "description"
    t.integer  "artifact_type_id"
    t.integer  "assignee_id"
    t.integer  "artifact_status_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "changes", ["artifact_id"], :name => "index_changes_on_artifact_id"
  add_index "changes", ["artifact_status_id"], :name => "index_changes_on_artifact_status_id"
  add_index "changes", ["artifact_type_id"], :name => "index_changes_on_artifact_type_id"
  add_index "changes", ["assignee_id"], :name => "index_changes_on_assignee_id"
  add_index "changes", ["changer_id"], :name => "index_changes_on_changer_id"
  add_index "changes", ["project_id"], :name => "index_changes_on_project_id"

  create_table "comments", :force => true do |t|
    t.integer  "project_id"
    t.integer  "artifact_id"
    t.integer  "owner_id"
    t.text     "body"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "comments", ["artifact_id"], :name => "index_comments_on_artifact_id"
  add_index "comments", ["owner_id"], :name => "index_comments_on_owner_id"
  add_index "comments", ["project_id"], :name => "index_comments_on_project_id"

  create_table "link_schemas", :force => true do |t|
    t.integer  "project_id"
    t.integer  "from_type_id"
    t.integer  "to_type_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "link_schemas", ["from_type_id"], :name => "index_link_schemas_on_from_type_id"
  add_index "link_schemas", ["project_id"], :name => "index_link_schemas_on_project_id"
  add_index "link_schemas", ["to_type_id"], :name => "index_link_schemas_on_to_type_id"

  create_table "links", :force => true do |t|
    t.integer  "project_id"
    t.integer  "from_artifact_id"
    t.integer  "to_artifact_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "links", ["from_artifact_id"], :name => "index_links_on_from_artifact_id"
  add_index "links", ["project_id"], :name => "index_links_on_project_id"
  add_index "links", ["to_artifact_id"], :name => "index_links_on_to_artifact_id"

  create_table "projects", :force => true do |t|
    t.integer  "administrator_id"
    t.string   "name"
    t.text     "description"
    t.integer  "maximum_history"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "projects", ["administrator_id"], :name => "index_projects_on_administrator_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
