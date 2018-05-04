FactoryBot.define do
  factory :story do
    board { create(:board) }
    name "MyString"
    position 1
  end
end
