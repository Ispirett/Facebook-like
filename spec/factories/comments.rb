FactoryBot.define do

  factory 'comment', class: Comment do
      body { "This comment has a great body"}
      user_id {1}
      commentable_id {1}
      commentable_type {"Post"}

  end

  factory 'comment_two', class: Comment do
     body {'This comment wants to run away'}
     user_id {1}
  end


end