FactoryBot.define do
  factory :friendship do
    user {nil}
    friend {nil}
    status {'Pending'}
  end

end