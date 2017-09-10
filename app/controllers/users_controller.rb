class UsersController < ApplicationController
  def show
    @topics = Topic.all
    @user_topics = current_user.topics.uniq
    @user_bookmarks = current_user.bookmarks
  end
end
