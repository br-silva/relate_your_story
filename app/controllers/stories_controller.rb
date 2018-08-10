class StoriesController < ApplicationController
  before_action :set_story, only: %i[edit update destroy]

  def index
    @stories = Story.all.order(created_at: :desc)
    @story = Story.new
  end

  def edit
    respond_to :html, :js
  end

  def create
    @story = Story.new(story_params)
    respond_to do |format|
      if @story.save
        flash[:success] = 'Story was successfully created.'

        format.html { redirect_to stories_url }
        format.js
      else
        format.html { render :index }
        format.js { render_error_messages }
      end
    end
  end

  def update
    respond_to do |format|
      if @story.update(story_params)
        flash[:success] = 'Story was successfully updated.'

        format.html { redirect_to stories_url }
        format.js
      else
        format.html { render :edit }
        format.js { render_error_messages }
      end
    end
  end

  def destroy
    @story.destroy
    flash[:success] = 'Story was successfully destroyed.'

    respond_to do |format|
      format.html { redirect_to stories_url }
      format.js
    end
  end

  private

  def set_story
    @story = Story.find(params[:id])
  end

  def story_params
    params.require(:story).permit(:title, :body)
  end

  def render_error_messages
    render json: @story.errors.full_messages, status: :unprocessable_entity
  end
end
