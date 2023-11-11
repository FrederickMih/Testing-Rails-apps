FactoryBot.define do
  factory :group do
    description { "Group to connect people" }
    group_type { "College" }
    name { "GCU" }
    size { 8 }
    leader 
  end
end
