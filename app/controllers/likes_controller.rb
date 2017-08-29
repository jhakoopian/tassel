class LikesController < ApplicationController
  def index
    @likes = Like.all
  end

  def create
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.build(bookmark: @bookmark)

    if like.save
      flash[:notice] = "You liked \"#{@bookmark.url}\"."
    else
      flash.now[:alert] = "There was an error liking \"#{@bookmark.url}\". Please try again."
    end

    redirect_to @bookmark.topic
  end

  def destroy
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.find(params[:id])

    if like.destroy
      flash[:notice] = "You unliked \"#{@bookmark.url}\"."
    else
      flash.now[:alert] = "There was an error unliking \"#{@bookmark.url}\". Please try again."
    end

    redirect_to @bookmark.topic
  end
end
