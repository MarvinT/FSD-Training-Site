class VideosController < ApplicationController

  before_filter :admin_required

  def new
    @user = session[:admin_user]
    @lesson = Lesson.find(params[:lesson_id])
    @lesson_title = Lesson.title(params[:lesson_id])
  end

  def create
    if request.post?


      if Video.isValidUrl?(params[:video][:url])

        @video = Video.new("url" => Video.embedableUrl(params[:video][:url]),
                           "title" => params[:video][:title])
        @video.save
        lesson = Lesson.find(params[:lesson_id])
        lesson.videos << @video
        flash[:notice] = "Video successfully uploaded."
        redirect_to lesson_path(params[:lesson_id])
      else
        flash[:notice] = "Sorry, your URL was invalid. Please enter a valid URL."
        redirect_to new_lesson_video_path(params[:lesson_id])
      end
    end
  end

  def destroy
    @video = Video.find(params[:id])
    @video.destroy
    @lesson = Lesson.find(params[:lesson_id])
    flash[:notice] = 'You have deleted a video for this lesson.'
    redirect_to lesson_path(@lesson)
  end

  def index
    @user = session[:admin_user]
    @videos = Lesson.find(params[:lesson_id]).videos.order(:position)
    @lesson_id = params[:lesson_id]
  end

  def sort
    params["components"].each_with_index { |id, index|
        video = Video.find(id.to_i)
        video.position = index
        video.save
      }

    render :nothing => true
  end


end
