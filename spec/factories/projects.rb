FactoryBot.define do
  factory :project do
    name "MyProject"
    user { create(:user) }
  end
end
