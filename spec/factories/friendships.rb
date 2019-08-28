FactoryBot.define do
  factory :friendship do
    friend_sender {nil}
    friend {nil}
    status {'Pending'}
  end

end