class CommentsController < ApplicationController

  before_filter :admin_required, :except => [:create]

  # def new
    # @lesson = Lesson.title(params[:lesson_id])
  # end

  def create
    @lesson = Lesson.find(params[:lesson_id])
    begin
      @comment = @lesson.comments.create!(params[:comment])
    rescue
      flash[:notice] = "You must enter a title for comment."
    end
    redirect_to lesson_path(@lesson)
  end

  def edit
    @user = session[:admin_user]
    @lesson = Lesson.find(params[:lesson_id])
    begin
      @comment = Comment.find(params[:id])
    rescue
      flash[:notice] = "Comment not found."
      redirect_to lesson_path(@lesson)
    end
  end

  def update
    @lesson = Lesson.find(params[:lesson_id])
    @comment = Comment.find params[:id]
    begin
      @comment.update_attributes!(params[:comment])
      flash[:notice] = "#{@comment.title} was successfully updated."
      redirect_to lesson_path(@lesson)
    rescue
      flash[:notice] = "You must enter a title for comment."
      redirect_to edit_lesson_comment_path(@comment)
    end
  end

  def destroy
    @lesson = Lesson.find(params[:lesson_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = "Comment '#{@comment.title}' deleted."
    redirect_to lesson_path(@lesson)
  end
end
