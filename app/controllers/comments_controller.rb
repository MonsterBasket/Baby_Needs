class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new
    @comment.user_id = 1
    @comment.commented_on = comment_params[:parent]
    @comment.content = comment_params[:content]

    respond_to do |format|
      if @comment.save
        format.html
      else
        format.html { render :new, status: :bad_request }
      end
    end
  end

  def show; end

  private
  def comment_params
    params.fetch(:comment, {})
  end
end