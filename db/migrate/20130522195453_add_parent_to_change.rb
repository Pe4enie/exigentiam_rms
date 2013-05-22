class AddParentToChange < ActiveRecord::Migration
  def change
    add_column :changes, :parent_id, :integer
  end
end
