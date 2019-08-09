FactoryBot.define do

  factory :user do
    
    email { 'i@gamil.com' }
    password {12345678}
  end

  factory :user_two, class: 'User' do

    email { 'n@gamil.com' }
    password{12345678}
  end
end