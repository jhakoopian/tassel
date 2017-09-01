class UsersController < ApplicationController
  def show
    @user_bookmarks = current_user.bookmarks
    @liked_bookmarks = current_user.likes.map(&:bookmark)
  end
end
