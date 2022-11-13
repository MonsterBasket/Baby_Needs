class ProblemsController < ApplicationController
  before_action :set_problem, only: %i[show edit update]

  def index
    @problems = Problem.all
  end

  def new
    @problem = Problem.new
  end

  def comment

  end

  def like(category = "like")
    this_problem = Problem.all.find(params[:id])
    this_like = Like.all.find{ |like| like.user_id == 2 && like.liked == this_problem }
    create_like = !this_like || this_like.category != category ? true : false
    this_like.destroy if this_like
    if create_like
      Like.create(user_id: 2, liked: this_problem, category: category)
    end
    redirect_to problem_path(this_problem)
  end

  def dislike
    like "dislike"
  end

  def create
    @problem = Problem.new
    @problem.title = problem_params[:title]
    @problem.description = problem_params[:description]
    @problem.user_id = 1
    @problem.rating = 0;

    respond_to do |format|
      if @problem.save
        format.html { redirect_to problem_url(@problem), alert: 'Problem successfully created. (uh oh!)'}
      else
        format.html { render :new, status: :bad_request }
      end
    end
  end

  def show; end

  private
  
  def set_problem
    @problem = Problem.find(params[:id])
  end

  def problem_params
    params.fetch(:problem, {})
  end
end