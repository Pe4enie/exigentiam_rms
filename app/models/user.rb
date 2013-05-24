class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  has_and_belongs_to_many :projects
  has_many :artifacts, foreign_key: 'assignee_id'
  has_many :comments, foreign_key: 'owner_id'
  has_many :changed_list, class_name: 'Change', foreign_key: 'changer_id'
  has_many :assigned_list, class_name: 'Change', foreign_key: 'assignee_id'
  has_many :attachments
  attr_accessible :email, :name, :password, :password_confirmation, :remember_me
end
