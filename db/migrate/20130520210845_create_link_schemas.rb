class CreateLinkSchemas < ActiveRecord::Migration
  def change
    create_table :link_schemas do |t|
      t.references :project
      t.references :from_type
      t.references :to_type

      t.timestamps
    end
    add_index :link_schemas, :project_id
    add_index :link_schemas, :from_type_id
    add_index :link_schemas, :to_type_id
  end
end
