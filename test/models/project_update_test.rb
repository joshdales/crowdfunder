require 'test_helper'
class UpdateTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "Update can be created" do
    project = create(:project)
    project_update = build(:project_update, project: project)
    project_update.save
    assert project_update.persisted?, 'Update should save'
  end

  test "Update must be associated to a valid project" do
    project_update = build(:project_update, project: nil)
    project_update.save
    assert project_update.invalid?, 'Update should have a project'
  end

  test "Update must have a valid title" do
    project_update = build(:project_update, title: nil)
    project_update.save
    assert project_update.invalid?, 'Update should have a title'
  end

  test "Update must have a valid description" do
    project = create(:project)
    project_update = ProjectUpdate.new(title: "Lowenthal")
    project_update.save
    assert project_update.invalid?, 'Update should have a title'
  end

  def new_update
    ProjectUpdate.new(
      title: "Lowenthal",
      description: "It's all going well!"
    )
  end
end
