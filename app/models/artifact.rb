class Artifact < ActiveRecord::Base
  belongs_to :project
  belongs_to :parent, class_name: 'Artifact'
  belongs_to :assignee, class_name: 'User'
  belongs_to :artifact_type
  belongs_to :artifact_status
  has_many :changes
  has_many :incoming_links, class_name: 'Link', foreign_key: 'to_artifact_id'
  has_many :outcoming_links, class_name: 'Link', foreign_key: 'from_artifact_id'
  has_many :comments
  attr_accessible :description, :identifier, :assignee_id, :artifact_type_id, :artifact_status_id
end
