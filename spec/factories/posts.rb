FactoryBot.define do
  factory :post do
    content {'cool content'}
  end

  factory :post_two, class: 'Post' do
    content {'cool content yes'}
  end

end