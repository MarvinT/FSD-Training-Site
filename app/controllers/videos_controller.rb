class VideosController < ApplicationController


  def new
    @lesson_title = Lesson.title(params[:lesson_id])
  end

  def create
    if request.post?

      @video = Video.new("url" => Video.embedableUrl(params[:video][:url]))
      @video.attributes.each do |attr_name, attr_value|
        puts "#{attr_name}, #{attr_value}"
      end
      if Video.isValidUrl?(params[:video][:url])
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





end
