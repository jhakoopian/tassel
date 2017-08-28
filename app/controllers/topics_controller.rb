class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :edit, :update, :destroy]

  def index
    @topics = Topic.all
  end

  def show
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = current_user.topics.new(topic_params)

    if @topic.save
      redirect_to topics_path, notice: "Your topic was saved successfully."
    else
      flash.now[:alert] = "There was an error creating your topic. Please try again."
      render :new
    end
  end

  def edit
  end

  def update
    @topic.assign_attributes(topic_params)

    if @topic.update_attributes(topic_params)
      flash[:notice] = "Your topic was updated."
      redirect_to topics_path
    else
      flash.now[:alert] = "There was an error updating your topic. Please try again."
      render :edit
    end
  end

  def destroy

    if @topic.destroy
      flash[:notice] = "\"#{@topic.title}\" was deleted successfully."
      redirect_to topics_path
    else
      flash.now[:alert] = "There was an error deleting the topic."
      render :show
    end
  end

  private
  def topic_params
    params.require(:topic).permit(:title)
  end

  def set_topic
    @topic = Topic.find(params[:id])
    authorize @topic
  end
end
