require_relative '../test_helper'

class PledgeTest < ActiveSupport::TestCase

  test 'A pledge can be created' do
    pledge = build(:pledge)
    pledge.save
    assert pledge.valid?
    assert pledge.persisted?
  end

  test 'owner cannot back own project' do
    project = create(:project)
    pledge = build(:pledge, project: project, user: project.user)
    pledge.save
    assert pledge.invalid?, 'Owner should not be able to pledge towards own project'
  end

  test 'pledge can not be created without dollar amount' do
    pledge = build(:pledge, dollar_amount: nil)
    pledge.save
    assert pledge.invalid?, 'Must pledge dollar amount'
  end
end
