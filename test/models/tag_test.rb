require_relative '../test_helper'

class TagTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test 'A tag can be added to a project' do
    project = create(:project)
    tag = create(:tag)

    project.tags << tag
    project.save

    results = project.tags.size
    expected = 1
    assert_equal expected, results
  end

end
