class PrezisController < ApplicationController

  before_filter :admin_required

  def new
    @user = session[:admin_user]
    @lesson = Lesson.find(params[:lesson_id])
    @lesson_title = Lesson.title(params[:lesson_id])
  end

  def create
    if request.post?
      if Prezi.isValidUrl?(params[:prezi][:url])
      
        @prezi = Prezi.new("url" => Prezi.embeddableUrl(params[:prezi][:url]), "title" => params[:prezi][:title])
        @prezi.save
        lesson = Lesson.find(params[:lesson_id])
        lesson.prezis << @prezi
        flash[:notice] = "Prezi successfully uploaded."
        redirect_to lesson_path(params[:lesson_id])
      else
        flash[:notice] = "Sorry, your URL was invalid. Please enter a valid URL."
        redirect_to new_lesson_prezi_path(params[:lesson_id])
      end
    end
  end

  def destroy
    @prezi = Prezi.find(params[:id])
    @prezi.destroy
    @lesson = Lesson.find(params[:lesson_id])
    flash[:notice] = 'You have deleted a prezi for this lesson.'
    redirect_to lesson_path(@lesson)
  end


  def index
    @user = session[:admin_user]
    @prezis = Lesson.find(params[:lesson_id]).prezis.order(:position)
    @lesson_id = params[:lesson_id]
  end

  def sort
    params["components"].each_with_index { |id, index|
        prezi = Prezi.find(id.to_i)
        prezi.position = index
        prezi.save
      }

    render :nothing => true
  end
end
