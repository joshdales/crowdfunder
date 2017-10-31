require 'test_helper'

class ProjectTest < ActiveSupport::TestCase

  test 'valid project can be created' do
    project = create(:project)
    assert project.valid?
    assert project.persisted?
    assert project.user
  end

  test 'project is invalid without owner' do
    project = build(:project, user: nil)
    project.save
    assert project.invalid?, 'Project should not save without owner.'
  end

  test 'project start date is not in the past' do
    project = build(:project, start_date: Date.today - 1.month)
    project.save
    assert project.invalid?, 'Project start date must not be in the past'
  end

  test 'project end date must be later than start date' do
    project = build(:project, end_date: Date.today)
    project.save
    assert project.invalid?, 'Project end date must be later than end date'
  end

  test 'project is invalid with goal = 0' do
    project = build(:project, goal: 0)
    project.save
    assert project.invalid?, 'Project should have a goal that is greater than 0.'
  end

  test 'project is invalid with goal < 0' do
    project = create(:project, goal: -1)
    assert project.invalid?, 'Project should have a goal that is positive.'
  end

  test 'Search for a project that exists' do
    project = create(:project)
    expected = [project]
    result = Project.search(project.title)
    assert_equal expected, result
  end

  test 'empty_search_returns_nothing' do
    project = build(:project)
    expected = []
    result = Project.search("")
    assert_equal expected, result
  end

  test 'search_for_a_project_that_doesnt_exist_returns_nothing' do
    project = build(:project)
    expected = []
    result = Project.search("sdifgjo")
    assert_equal expected, result
  end
end
