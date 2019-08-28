module CommentSupport
  def create_comment(comment)
    fill_in 'comment_body', with: comment.body
    click_button 'submit'
  end
end