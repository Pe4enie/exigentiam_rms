class Project < ActiveRecord::Base
  belongs_to :user
  attr_accessible :description, :maximum_history, :name
end
