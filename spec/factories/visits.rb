FactoryBot.define do
  factory :visit do
    patient { "#{Faker::Name.first_name} #{Faker::Name.last_name}" }
    patient_dob { Faker::Date.birthday(min_age: 32, max_age: 98) }
    admit_date { Faker::Date.between(from: Date.today - 2.years, to: Date.today) }
    hospital_name { Faker::Company.unique.name }
    sequence(:hospital_id) { |n| "hospital-#{n}" }
    visit_type { (2..4).to_a.sample }
    pac { Faker::Company.unique.name }
    codes { [{"code"=>"COVNEG", "name"=>"COV-19 test: negative"}, {"code"=>"COVSUS", "name"=>"Suspected covid by dx"}, {"code"=>"COVPOS", "name"=>"COV-19 test: positive"}] }

    trait :snf do
      visit_type { 2 }
    end

    trait :hospice do
      visit_type { 3 }
    end

    trait :hha do
      visit_type { 4 }
    end
  end
end
