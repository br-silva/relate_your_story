class StoriesController < ApplicationController
  before_action :set_story,    only: %i[edit update destroy]
  before_action :authenticate, only: %i[new edit create destroy]

  def index
    @stories = Story.all.order(created_at: :desc)
  end

  def new
    @story = current_user.stories.build
    respond_to :html, :js
  end

  def edit
    respond_to :html, :js
  end

  # rubocop:disable Metrics/AbcSize
  def create
    @story = current_user.stories.build(story_params)
    respond_to do |format|
      if @story.save
        message = 'Story was successfully created.'

        format.html { redirect_to stories_url, notice: message }
        format.js   { flash.now[:notice] = message }
      else
        format.html { render :index }
        format.js   { render_error_messages }
      end
    end
  end
  # rubocop:enable Metrics/AbcSize

  def update
    respond_to do |format|
      if @story.update(story_params)
        message = 'Story was successfully updated.'

        format.html { redirect_to stories_url, notice: message }
        format.js   { flash.now[:notice] = message }
      else
        format.html { render :edit }
        format.js   { render_error_messages }
      end
    end
  end

  def destroy
    @story.destroy
    message = 'Story was successfully destroyed.'

    respond_to do |format|
      format.html { redirect_to stories_url, notice: message }
      format.js   { flash.now[:notice] = message }
    end
  end

  private

  def set_story
    @story = current_user.stories.find_by_id(params[:id])
    @story.present? ? @story : display_user_not_allowed
  end

  def story_params
    params.require(:story).permit(:title, :body)
  end

  def render_error_messages
    render json: @story.errors, status: :unprocessable_entity
  end

  def display_user_not_allowed
    message = 'You are not allowed to perform this action.'
    respond_to do |format|
      format.html { redirect_to stories_url, notice: message }
      format.js   { render js: "alert('#{message}')" }
    end
  end
end
