class CreateUsersProjectsTable < ActiveRecord::Migration
  def up
    create_table :users_projects, :id => false do |t|
      t.references :user
      t.references :project
    end
    add_index :users_projects, [:user_id, :project_id]
    add_index :users_projects, [:project_id, :user_id]
  end

  def down
    drop_table :users_projects
  end
end
