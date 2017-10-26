require 'test_helper'
class UpdateTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "Update can be created" do
    owner = new_user
    owner.save
    project = new_project
    project.user = owner
    project.save
    update = new_update
    update.project = project
    update.save
    assert update.persisted?, 'Update should save'
  end

  test "Update must be associated to a valid project" do
    owner = new_user
    owner.save
    update = new_update
    update.save
    assert update.invalid?, 'Update should have a project'
  end


  def new_project
    Project.new(
      title:       'Cool new boardgame',
      description: 'Trade sheep',
      start_date:  Date.today,
      end_date:    Date.today + 1.month,
      goal:        50000
    )
  end

  def new_user
    User.new(
      first_name:            'Sally',
      last_name:             'Lowenthal',
      email:                 'sally@example.com',
      password:              'passpass',
      password_confirmation: 'passpass'
    )
  end

  def new_update
    ProjectUpdate.new(
      title: "It's all going well!",
      description: "Lowenthal"
    )
  end
end
