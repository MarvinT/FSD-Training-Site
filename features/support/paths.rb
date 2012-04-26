# TL;DR: YOU SHOULD DELETE THIS FILE
#
# This file is used by web_steps.rb, which you should also delete
#
# You have been warned
module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /^the home\s?page$/
      '/'

    when /^the login page$/ 
      login_path
      
    when /^the detail page for "(.*)"$/
      lesson = Lesson.find_by_title($1)
      lesson_path(lesson)
      
    when /^the comment edit page for "(.*)"$/
      comment = Comment.find_by_title($1)
      edit_lesson_comment_path(comment.lesson_id, comment.id)

    when /^the detail page for lesson number "(.*)"/
      lesson_path($1)

    when /^the FSD-Training-Site home page$/
      lessons_path

    when /^the edit page for "(.*)"$/
      edit_lesson_path(Lesson.find_by_title($1))

    when /^the create page$/
      new_lesson_path

    when /^the details page for "(.*)"$/
      lesson_path(Lesson.find_by_title($1))


    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
