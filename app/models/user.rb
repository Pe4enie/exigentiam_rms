class User < ActiveRecord::Base
  has_and_belongs_to_many :projects
  has_many :artifacts, foreign_key: 'assignee_id'
  has_many :comments, foreign_key: 'owner_id'
  has_many :changed_list, class_name: 'Change', foreign_key: 'changer_id'
  has_many :assigned_list, class_name: 'Change', foreign_key: 'assignee_id'
  attr_accessible :email, :name, :password
end
