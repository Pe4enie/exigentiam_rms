class Comment < ActiveRecord::Base
  belongs_to :project
  belongs_to :artifact
  belongs_to :owner, class_name: 'User'
  attr_accessible :body
end
