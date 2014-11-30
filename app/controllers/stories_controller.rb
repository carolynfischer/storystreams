class StoriesController < ApplicationController
  before_action :set_story, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  skip_before_filter :authenticate_user!, :only => [:index, :show]
  # GET /stories
  # GET /stories.json
  def index
    @stories = if params[:tag]
      Story.all.tagged_with(params[:tag])
    else
      Story.all
    end
  end

  # GET /stories/1
  # GET /stories/1.json
  def show
    @story = Story.find(params[:id])
    @pictures = @story.pictures
  end

  # GET /stories/new
  def new
    @story = Story.new
  end

  # GET /stories/1/edit
  def edit
  end

  # POST /stories
  # POST /stories.json
  def create
    @story = Story.new(story_params)
    @story.user = current_user

    respond_to do |format|
      if @story.save
        params[:story][:picture].each_with_index do |image, i| 
          picture = Picture.create(:filename => image)
          picture.story = @story
          picture.description = params[:story][:description][i]
          picture.credits = params[:story][:credits][i]
          picture.save
          if i == params[:story][:isCover].to_i
            @story.cover_picture = picture
            @story.save
          end
        end
        format.html { redirect_to @story, notice: 'Story was successfully created.' }
        format.json { render :show, status: :created, location: @story }
      else
        format.html { render :new }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  def tagged
    if params[:tag_list].present? 
      @stories = Story.tagged_with(params[:tag_list])
    else 
      @stories = Story.all
    end  
  end

  # PATCH/PUT /stories/1
  # PATCH/PUT /stories/1.json
  def update
    respond_to do |format|
      if @story.update(story_params)
        format.html { redirect_to @story, notice: 'Story was successfully updated.' }
        format.json { render :show, status: :ok, location: @story }
      else
        format.html { render :edit }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stories/1
  # DELETE /stories/1.json
  def destroy
    @story.destroy
    respond_to do |format|
      format.html { redirect_to stories_url, notice: 'Story was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_story
      @story = Story.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def story_params
      params.require(:story).permit(:title, :description, :tag_list, :date)
    end

end
