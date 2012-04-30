class DocumentsController < ApplicationController

  before_filter :admin_required

  def new
    @lesson_title = Lesson.title(params[:lesson_id])
  end

  def create
    if request.post?
      if Document.isValidUrl?(params[:document][:url])

        @doc = Document.new("url" => Document.embedableUrl(params[:document][:url]),
                            "title" => params[:document][:title])
        @doc.save
        lesson = Lesson.find(params[:lesson_id])
        lesson.documents << @doc
        flash[:notice] = "Document successfully uploaded."
        redirect_to lesson_path(params[:lesson_id])
      else
        flash[:notice] = "Sorry, your URL was invalid. Please enter a valid URL."
        redirect_to new_lesson_document_path(params[:lesson_id])
      end
    end
  end

  def destroy
    @doc = Document.find(params[:id])
    @doc.destroy
    @lesson = Lesson.find(params[:lesson_id])
    flash[:notice] = 'You have deleted a document for this lesson.'
    redirect_to lesson_path(@lesson)
  end


  def index
    @documents = Lesson.find(params[:lesson_id]).documents.order(:position)
    @lesson_id = params[:lesson_id]
  end

  def sort
    params["components"].each_with_index { |id, index|
        doc = Document.find(id.to_i)
        doc.position = index 
        doc.save
      }

    render :nothing => true
  end

end

