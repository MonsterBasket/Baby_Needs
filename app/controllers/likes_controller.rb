class LikesController < ApplicationController

  def create
    

  end


  def create
    @comment = Comment.new
    @comment.user_id = 1
    binding.pry
    @comment.commented_on_id = comment_params[:parent_id]
    @comment.commented_on_type = comment_params[:parent_type]
    @comment.content = comment_params[:content]

    respond_to do |format|
      if @comment.save
        format.html
      else
        format.html { render :new, status: :bad_request }
      end
    end
  end



end