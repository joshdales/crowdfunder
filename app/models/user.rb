class User < ActiveRecord::Base
  has_secure_password
  has_many :projects
  has_many :pledges
  has_many :pledged_projects, through: :pledges, source: :project
  has_many :project_comments

  validates :password, length: { minimum: 8 }, on: :create
  validates :password, confirmation: true, on: :create
  validates :password_confirmation, presence: true, on: :create

  validates :email, uniqueness: true
end
