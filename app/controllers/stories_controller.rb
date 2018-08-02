class StoriesController < ApplicationController
  before_action :set_story, only: %i[show edit update destroy]

  def index
    @stories = Story.all
  end

  def show; end

  def new
    @story = Story.new
  end

  def edit; end

  def create
    @story = Story.new(story_params)

    respond_to do |format|
      if @story.save
        format.html do
          redirect_to @story, notice: 'Story was successfully created.'
        end
        format.json { render :show, status: :created, location: @story }
      else
        format.html { render :new }
        format.json do
          render json: @story.errors, status: :unprocessable_entity
        end
      end
    end
  end

  def update
    respond_to do |format|
      if @story.update(story_params)
        format.html do
          redirect_to @story, notice: 'Story was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @story }
      else
        format.html { render :edit }
        format.json do
          render json: @story.errors, status: :unprocessable_entity
        end
      end
    end
  end

  def destroy
    @story.destroy
    respond_to do |format|
      format.html do
        redirect_to stories_url, notice: 'Story was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private

  def set_story
    @story = Story.find(params[:id])
  end

  def story_params
    params.require(:story).permit(:title, :body)
  end
end
