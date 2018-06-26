FactoryBot.define do
  factory :project do
    name "MyProject"
    user { create(:user) }

    factory :manager do
      after(:create){ |user| user.add_role(:manager)}
    end
  end
end
