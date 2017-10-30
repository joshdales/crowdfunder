require 'test_helper'
class UpdateTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "Update can be created" do
    project = create(:project)
    update = new_update
    update.project = project
    update.save
    assert update.persisted?, 'Update should save'
  end

  test "Update must be associated to a valid project" do
    update = new_update
    update.save
    assert update.invalid?, 'Update should have a project'
  end

  test "Update must have a valid title" do
    project = create(:project)
    project_update = ProjectUpdate.new(description: "It's all going well!")
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
