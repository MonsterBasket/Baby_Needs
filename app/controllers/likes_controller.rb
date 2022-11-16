class LikesController < ApplicationController

  def create_or_delete
    item = Kernel.const_get(like_params[:parent_type]).all.find(like_params[:parent_id])
    this_like = Like.find{ |like| like.user_id == like_params[:user_id].to_i && like.liked == item }
    create_like = !this_like || this_like.category != like_params[:category] ? true : false
    this_like.destroy if this_like
    if create_like
      create
    else
      redirect_to "/#{like_params[:page_type].downcase}s/#{like_params[:page_id]}"
    end
  end

  def create
    @like = Like.new
    @like.user_id = like_params[:user_id]
    @like.liked_id = like_params[:parent_id]
    @like.liked_type = like_params[:parent_type]
    @like.category = like_params[:category]

    respond_to do |format|
      if @like.save
        format.html { redirect_to "/#{like_params[:page_type].downcase}s/#{like_params[:page_id]}" }
      else
        format.html { redirect_to "/#{like_params[:page_type].downcase}s/#{like_params[:page_id]}", status: :bad_request }
      end
    end
  end

  private
  def like_params
    params.fetch(:like, {})
  end


end