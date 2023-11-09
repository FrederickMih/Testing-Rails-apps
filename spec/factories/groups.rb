FactoryBot.define do
  factory :group do
    description { "Students connecting group" }
    group_type { "College" }
    name { "GCU" }
    size { 7 }
    leader
  end
end
