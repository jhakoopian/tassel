class BookmarksController < ApplicationController
  before_action :set_topic

  def show
    @bookmark = Bookmark.find(params[:id])
  end

  def new
    @bookmark = Bookmark.new
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @bookmark = @topic.bookmarks.new(bookmark_params)

    if @bookmark.save
      flash[:notice] = "\"#{@bookmark.url}\" was added to your bookmarks."
      redirect_to @topic
    else
      flash.now[:alert] = "There was an error adding \"#{@bookmark.url}\" from your bookmarks. Please try again."
      render :new
    end
  end

  def edit
    @bookmark = Bookmark.find(params[:id])
  end

  def update
    @bookmark = Bookmark.find(params[:id])
    @bookmark.assign_attributes(bookmark_params)

    if @bookmark.update_attributes(bookmark_params)
      flash[:notice] = "Your bookmark was updated."
      redirect_to @topic
    else
      flash.now[:alert] = "There was an error updating your bookmark. Please try again."
      render :edit
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])

    if @bookmark.destroy
      flash[:notice] = "\"#{@bookmark.url}\" was removed from your bookmarks."
      redirect_to @bookmark.topic
    else
      flash.now[:alert] = "There was an error removing \"#{@bookmark.url}\" from your bookmarks. Please try again."
      render :show
    end
  end

  private
  def bookmark_params
    params.require(:bookmark).permit(:url)
  end

  def set_topic
    @topic = Topic.find(params[:topic_id])
  end
end
