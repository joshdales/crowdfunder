require 'test_helper'

class RewardTest < ActiveSupport::TestCase

  test 'A reward can be created' do
    reward = create(:reward)
    assert reward.valid?
    assert reward.persisted?
  end

  test 'A reward cannot be created without a dollar amount' do
    reward = build(:reward, dollar_amount: nil)
    reward.save
    assert reward.invalid?, 'Reward should be invalid without dollar amount'
    assert reward.new_record?, 'Reward should not save without dollar amount'
  end

  test 'A reward cannot be created without a description' do
    reward = build(:reward, description: nil)
    assert reward.invalid?, 'Reward should be invalid without a description'
    assert reward.new_record?, 'Reward should not save without a description'
  end

  test 'reward is invalid with dollar_amount = 0' do
    reward = build(:reward, dollar_amount: 0)
    reward.save
    assert reward.invalid?, 'Reward should have a dollar_amount that is greater than 0.'
  end

  test 'reward is invalid with negative dollar_amount' do
    reward = build(:reward, dollar_amount: -1)
    reward.save
    assert reward.invalid?, 'Reward should have a dollar_amount that is positive.'
  end
end
