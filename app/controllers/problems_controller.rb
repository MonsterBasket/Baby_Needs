class ProblemsController < ApplicationController
  def index
    @problems = Problem.all
  end

  def show; end
  def new; end

  def create
    @problem = Problem.new
    @problem.title = problem_params[:title]
    @problem.description = problem_params[:description]
    @problem.user_id = problem_params[:user_id]
    @problem.rating = 0;

    respond_to do |format|
      if @problem.save
        format.html { redirect_to problem_url(@problem), alert: 'Problem successfully created. (uh oh!)'}
      else
        format.html { render :new, status: :bad_request }
      end
    end
  end
end