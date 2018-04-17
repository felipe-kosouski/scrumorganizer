FactoryBot.define do
  factory :board do
    name "My new Board"
    position 1
    project { create(:project) }
  end
end
