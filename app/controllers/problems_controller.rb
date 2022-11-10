class ProblemsController < ApplicationController
  before_action :set_problem, only: %i[show edit update]

  def index
    @problems = Problem.all
  end

  def show; end
  
  def new
    @problem = Problem.new
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

  private
  
  def set_problem
    @problem = Problem.find(params[:id])
  end

  def problem_params
    params.fetch(:problem, {})
  end
end