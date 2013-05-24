class Project < ActiveRecord::Base
  belongs_to :administrator, class_name: 'User'
  has_and_belongs_to_many :users
  has_many :artifacts
  has_many :changes
  has_many :link_schemas
  has_many :links
  has_many :artifact_types
  has_many :artifact_statuses
  has_many :comments
  has_many :attachments
  attr_accessible :description, :maximum_history, :name
end
