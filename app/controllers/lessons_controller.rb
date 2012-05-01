class LessonsController < ApplicationController

  before_filter :admin_required, :except => [:index, :show]

  def show
    @lessons = Lesson.order(:position)
    @user = session[:admin_user]
    banners = ["banner1.jpg", "banner2.jpg", "banner3.jpg", "banner4.jpg", "banner5.jpg", "banner6.jpg", "banner7.jpg", "banner8.jpg"]
    random = rand(8)
    @banner = banners[random]
    id = params[:id] # retrieve lesson ID from URI route

    begin
      @lesson = Lesson.find(id) # look up lesson by unique ID

      @documents = @lesson.documents.order(:position)

      @prezis = @lesson.prezis.order(:position)

      @videos = @lesson.videos.order(:position)

      allcomments = @lesson.comments

      @totalpage = (allcomments.length/15.to_f).ceil

      @currentpage = params[:page]

      if @currentpage == nil
        @currentpage = '1'
        @comments = allcomments[0,15]
      elsif @currentpage.to_i > 0 and @currentpage.to_i <= @totalpage.to_i
        @comments = allcomments[(@currentpage.to_i-1)*15,15]
      else
        @currentpage = 1
        @comments = allcomments[0,15]
        flash[:notice] = "Comment page out of range."
      end

    rescue Exception => e
      puts e.message
      flash[:notice] = "Lesson not found."
      redirect_to lessons_path
    end
    # will render app/views/lessons/show.<extension> by default
  end

  def index
    @user = session[:admin_user]
    banners = ["banner1.jpg", "banner2.jpg", "banner3.jpg", "banner4.jpg", "banner5.jpg", "banner6.jpg", "banner7.jpg", "banner8.jpg"]
    random = rand(8)
    @banner = banners[random]
    @user = session[:admin_user]
    @lessons = Lesson.order(:position)
  end

  def new
    @user = session[:admin_user]
    # default: render 'new' template
  end

  def create
    @lesson = Lesson.new(params[:lesson])
    if @lesson.save and !@lesson.title.blank?
      flash[:notice] = "#{@lesson.title} was successfully created."
      redirect_to lessons_path
    else
      flash[:notice] = "You must enter a title for lesson."
      redirect_to new_lesson_path
    end
  end

  def edit
    @user = session[:admin_user]
    begin
      @lesson = Lesson.find(params[:id])
    rescue
      flash[:notice] = "Lesson not found."
      redirect_to lessons_path
    end
  end

  def update
    @lesson = Lesson.find params[:id]
    begin
      @lesson.update_attributes!(params[:lesson])
      flash[:notice] = "#{@lesson.title} was successfully updated."
      redirect_to lesson_path(@lesson)
    rescue
      flash[:notice] = "You must enter a title for lesson."
      redirect_to edit_lesson_path(@lesson)
    end
  end

  def destroy
    @lesson = Lesson.find(params[:id])
    @lesson.destroy
    flash[:notice] = "Lesson '#{@lesson.title}' deleted."
    redirect_to lessons_path
  end

  def sort
    params["lessons"].each_with_index { |id, index|
        lesson = Lesson.find(id.to_i)
        lesson.position = index
        lesson.save
      }

    render :nothing => true
  end

end
