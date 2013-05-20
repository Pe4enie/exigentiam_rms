class Change < ActiveRecord::Base
  belongs_to :project
  belongs_to :artifact
  belongs_to :changer, class_name: 'User'
  belongs_to :artifact_type
  belongs_to :assignee, class_name: 'User'
  belongs_to :artifact_status
  attr_accessible :description, :version
end
