FactoryBot.define do
  factory :group do
    description { "Students connecting group" }
    group_type { "College" }
    name { "GCU" }
    size { 8 }
    leader 
  end
end
