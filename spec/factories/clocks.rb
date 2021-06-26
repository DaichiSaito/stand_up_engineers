FactoryBot.define do
  factory :clock do
    user
    set_time {25}
    break_time {5}
    category {"筋トレ"}
  end
end
