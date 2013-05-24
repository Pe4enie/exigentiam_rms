class AddPathToAttachments < ActiveRecord::Migration
  def change
    add_column :attachments, :path, :string
  end
end
