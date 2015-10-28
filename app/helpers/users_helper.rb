module UsersHelper

  def posts?(user)
    if user.posts.count == 0
      content_tag :h4, "#{user.name} has not submitted any posts yet."
    else
      content_tag :h4, pluralize(@user.posts.count, 'post')
    end
  end

  def comments?(user)
    if user.comments.count == 0
      content_tag :h4, "#{user.name} has not submitted any comments yet."
    else
      content_tag(:h4, pluralize(@user.comments.count, 'comment'), class:'js-comments-count')
    end
  end

end
