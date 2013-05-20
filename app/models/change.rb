class Change < ActiveRecord::Base
  belongs_to :project
  belongs_to :artifact
  belongs_to :user
  belongs_to :artifact_type
  belongs_to :assigned_to_user
  belongs_to :artifact_status
  attr_accessible :description, :version
end
