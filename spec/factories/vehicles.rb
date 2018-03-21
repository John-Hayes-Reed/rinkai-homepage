FactoryBot.define do
  factory :vehicle do
    name 'TEST_NAME'
    amount 1

    %i[name amount].each do |att|
      trait :"nil_#{att}" do
        send att, nil
      end
    end
    trait :low_amount do
      amount 0
    end
  end
end
