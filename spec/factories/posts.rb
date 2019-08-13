FactoryBot.define do


    factory :post, class: 'Post' do
        
        user_id { 1 }
        created_at { Time.new }
        updated_at { Time.new }
    end
  
    factory :post_two, class: 'Post' do
        
        user_id { 1 }
        created_at { Time.new }
        updated_at { Time.new }
    end
  end

