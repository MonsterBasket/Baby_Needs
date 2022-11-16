class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new
    @comment.user_id = current_user.id
    @comment.commented_on_id = comment_params[:parent_id]
    @comment.commented_on_type = comment_params[:parent_type]
    @comment.content = comment_params[:content]

    respond_to do |format|
      if @comment.save
        format.html { redirect_to "/#{comment_params[:page_type].downcase}s/#{comment_params[:page_id]}" }
      else
        format.html { redirect_to "/#{comment_params[:page_type].downcase}s/#{comment_params[:page_id]}", status: :bad_request }
      end
    end
  end

  def show; end

  private
  def comment_params
    params.fetch(:comment, {})
  end
end