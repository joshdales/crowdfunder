FactoryBot.define do
  factory :pledge do
    dollar_amount 99.00
    project
    reward
    user
  end
end
