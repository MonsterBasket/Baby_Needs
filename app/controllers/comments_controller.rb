class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def like(category = "like")
    this_comment = Comment.all.find(params[:id])
    this_like = Like.all.find{ |like| like.user_id == 2 && like.liked == this_comment }
    create_like = !this_like || this_like.category != category ? true : false
    this_like.destroy if this_like
    if create_like
      Like.create(user_id: 2, liked: this_comment, category: category)
    end
    #redirect_to comment_path(this_comment)
  end

  def dislike
    like "dislike"
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

  def show; end

  private
  def comment_params
    params.fetch(:comment, {})
  end
end