class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.references :administrator
      t.string :name
      t.text :description
      t.integer :maximum_history

      t.timestamps
    end
    add_index :projects, :administrator_id
  end
end
