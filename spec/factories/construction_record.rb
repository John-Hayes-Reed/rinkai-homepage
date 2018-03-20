FactoryBot.define do
  factory :construction_record do
    title 'TEST_TITLE'
    customer 'TEST_CUSTOMER'
    description 'TEST_DESCRIPTION'
    category 'TEST_CATEGORY'
    started_on Date.today - 3.days
    finished_on Date.today - 1.day
  end

  %i[title customer description category started_on finished_on ].each do |att|
    trait :"nil_#{att}" do
      send att, nil
    end
  end
end
