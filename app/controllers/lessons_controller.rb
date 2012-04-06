class LessonsController < ApplicationController

  def show
    id = params[:id] # retrieve lesson ID from URI route
    @lesson = Lesson.find(id) # look up lesson by unique ID
    # will render app/views/lessons/show.<extension> by default
  end

  def index
    @lessons = Lesson.all
  end

  def new
    # default: render 'new' template
  end

  def create
    @lesson = Lesson.new(params[:lesson])
    if request.post?
      if @lesson.save 
        flash[:notice] = "#{@lesson.title} was successfully created."
        redirect_to lessons_path
      else
        flash[:notice] = "You must enter a title for lesson."
        redirect_to new_lesson_path
      end  
    end  
  end

  def edit
    @lesson = Lesson.find params[:id]
  end
 
  def update
    @lesson = Lesson.find params[:id]
    if request.post?
      if Lesson.update(params[:id], params[:lesson])
        flash[:notice] = "#{@lesson.title} was successfully updated."
        redirect_to lesson_path(@lesson)
      else
        flash[:notice] = "You must enter a title for lesson."
        redirect_to edit_lesson_path(@lesson)
      end
    end
  end

  # def update
    # @lesson = Lesson.find params[:id]
    # @lesson.update_attributes!(params[:lesson])
    # flash[:notice] = "#{@lesson.title} was successfully updated."
    # redirect_to lesson_path(@lesson)
  # end

  def destroy
    @lesson = Lesson.find(params[:id])
    @lesson.destroy
    flash[:notice] = "Lesson '#{@lesson.title}' deleted."
    redirect_to lessons_path
  end

  def addVideo
    lesson = Lesson.find(params[:id])
    url = params[:video_url]
    if Video.isValidUrl?(url)
      new_video = Video.new(:url => url)
      lesson.components << new_video
      lesson.save!
      flash[:notice] = "Video has been added to this lesson"
    else
      flash[:error] = "Video url is invalid"
    end
    redirect_to edit
  end

end
