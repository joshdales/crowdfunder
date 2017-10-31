class ProjectComment < ApplicationRecord
  belongs_to :user
  belongs_to :project

  validates :comment, :user_id, :project_id, presence: true
end
