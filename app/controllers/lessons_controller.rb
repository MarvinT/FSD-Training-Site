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
    @lesson = Lesson.create!(params[:lesson])
    flash[:notice] = "#{@lesson.title} was successfully created."
    redirect_to lessons_path
  end
  
  def edit
    @lesson = Lesson.find params[:id]
  end  
 
  def update
    @lesson = Lesson.find params[:id]
    @lesson.update_attributes!(params[:lesson])
    flash[:notice] = "#{@lesson.title} was successfully updated."
    redirect_to lesson_path(@lesson)
  end
   
  def destroy
    @lesson = Lesson.find(params[:id])
    @lesson.destroy
    flash[:notice] = "Lesson '#{@lesson.title}' deleted."
    redirect_to lessons_path
  end
    
end