FactoryBot.define do

    factory :like, class: 'Like' do
        post_id { 1 }
        user_id { 1 }
        created_at { Time.new }
        updated_at { Time.new }
    end
  
    factory :like_two, class: 'Like' do
        post_id { 1 }
        user_id { 1 }
        created_at { Time.new }
        updated_at { Time.new }
    end
  end