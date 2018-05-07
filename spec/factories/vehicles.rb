FactoryBot.define do
  factory :vehicle do
    name 'TEST_NAME'
    amount 1
    make 'TEST_MAKE'
    serial 'TEST_SERIAL'

    %i[name amount make serial].each do |att|
      trait :"nil_#{att}" do
        send att, nil
      end
    end
    trait :low_amount do
      amount 0
    end
  end
end
