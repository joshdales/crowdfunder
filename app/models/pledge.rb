class Pledge < ApplicationRecord
  belongs_to :user
  belongs_to :project
  belongs_to :reward


  validates :dollar_amount, presence: true
  validates :user, presence: true
  validate :pledge_user_is_not_owner

  def pledge_user_is_not_owner
    if user == project.user
      errors.add(:user, "You cannot back your own project")
    end
  end
end
