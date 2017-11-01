FactoryBot.define do
  factory :reward do
    dollar_amount 99.00
    description 'A heartfelt thanks!'
    limit 10
    project
  end
end
