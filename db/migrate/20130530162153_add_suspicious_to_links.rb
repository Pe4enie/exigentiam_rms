class AddSuspiciousToLinks < ActiveRecord::Migration
  def change
    add_column :links, :suspicious, :boolean, default: :false
  end
end
