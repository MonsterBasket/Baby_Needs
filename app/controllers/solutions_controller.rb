class SolutionsController < ApplicationController
  before_action :set_problem, only: %i[show]
  def index
    @solutions = Solution.all
  end

  def show
    @solution
  end

  def new
    @solution = Solution.new
  end

  def create
    @solution = Solution.new
    @solution.description = solution_params[:description]
    @solution.user = current_user
    @solution.problem = Problem.find { |prob| prob.id.to_s == solution_params[:problem_id] }
    @solution.rating = 0;

    respond_to do |format|
      if @solution.save
        format.html { redirect_to "/problems/#{solution_params[:problem_id]}", alert: 'Solution successfully created, problem solved! (hopefully!)'}
      else
        format.html { redirect_to "/problems/#{solution_params[:problem_id]}", status: :bad_request }
      end
    end
  end

  private
  def set_solution
    @solution = Solution.find(params[:id])
  end

  def solution_params
    params.fetch(:solution, {})
  end
end