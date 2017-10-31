FactoryBot.define do
  factory :pledge do
    dollar_amount 99.00
    project
    user
    reward
  end
end
