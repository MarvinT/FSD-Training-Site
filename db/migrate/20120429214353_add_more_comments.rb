class AddMoreComments < ActiveRecord::Migration
  MORE_COMMENTS = [
    {:title => 'Comment 1: Sample Comment', :body => 'This is a sample body for Comment 1', :editor => 'User1', :lesson_id => '1'},
    {:title => 'Comment 2: Sample Comment', :body => 'This is a sample body for Comment 2', :editor => 'User2', :lesson_id => '1'},
    {:title => 'Comment 3: Sample Comment', :body => 'This is a sample body for Comment 3', :editor => 'User3', :lesson_id => '1'},
    {:title => 'Comment 4: Sample Comment', :body => 'This is a sample body for Comment 4', :editor => 'User4', :lesson_id => '1'},
    {:title => 'Comment 5: Sample Comment', :body => 'This is a sample body for Comment 5', :editor => 'User5', :lesson_id => '1'},
    {:title => 'Comment 6: Sample Comment', :body => 'This is a sample body for Comment 6', :editor => 'User6', :lesson_id => '1'},
    {:title => 'Comment 7: Sample Comment', :body => 'This is a sample body for Comment 7', :editor => 'User7', :lesson_id => '1'},
    {:title => 'Comment 8: Sample Comment', :body => 'This is a sample body for Comment 8', :editor => 'User8', :lesson_id => '1'},
    {:title => 'Comment 9: Sample Comment', :body => 'This is a sample body for Comment 9', :editor => 'User9', :lesson_id => '1'},
    {:title => 'Comment 10: Sample Comment', :body => 'This is a sample body for Comment 10', :editor => 'User10', :lesson_id => '1'},
    {:title => 'Comment 11: Sample Comment', :body => 'This is a sample body for Comment 11', :editor => 'User11', :lesson_id => '1'},
    {:title => 'Comment 12: Sample Comment', :body => 'This is a sample body for Comment 12', :editor => 'User12', :lesson_id => '1'},
    {:title => 'Comment 13: Sample Comment', :body => 'This is a sample body for Comment 13', :editor => 'User13', :lesson_id => '1'},
    {:title => 'Comment 14: Sample Comment', :body => 'This is a sample body for Comment 14', :editor => 'User14', :lesson_id => '1'},
    {:title => 'Comment 15: Sample Comment', :body => 'This is a sample body for Comment 15', :editor => 'User15', :lesson_id => '1'},
    {:title => 'Comment 16: Sample Comment', :body => 'This is a sample body for Comment 16', :editor => 'User16', :lesson_id => '1'},
  ]
  def up
    MORE_COMMENTS.each do |comment|
      Comment.create!(comment)
    end
  end

  def down
    MORE_COMMENTS.each do |comment|
      Comment.find_by_title(comment[:title]).destroy
    end
  end
end
    