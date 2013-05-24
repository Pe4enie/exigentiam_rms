class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.references :project
      t.references :artifact
      t.references :user
      t.string :file

      t.timestamps
    end
    add_index :attachments, :project_id
    add_index :attachments, :artifact_id
    add_index :attachments, :user_id
  end
end
