FactoryBot.define do
  factory :construction_record do
    title { 'TEST_TITLE' }
    customer { 'TEST_CUSTOMER' }
    description { 'TEST_DESCRIPTION' }
    category { :civil }
    started_on { Date.new(2017, 2, 1) - 3.days }
    finished_on { Date.new(2017, 2, 1) - 1.day }

    %i[title customer description category started_on finished_on ].each do |att|
      trait :"nil_#{att}" do
        send(att) { nil }
      end
    end
  end
end
