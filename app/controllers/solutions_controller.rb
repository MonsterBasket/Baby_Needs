class SolutionsController < ApplicationController
  def index
    @solutions = Solution.all
  end

  def show; end
  def new; end

  def create
    @solution = Solution.new
    @solution.description = solution_params[:description]
    @solution.user_id = solution_params[:user_id]
    @solution.problem_id = solution_params[:problem_id]
    @solution.rating = 0;

    respond_to do |format|
      if @solution.save
        format.html { redirect_to solution_url(@solution), alert: 'Solution successfully created, problem solved! (hopefully!)'}
      else
        format.html { render :new, status: :bad_request }
      end
    end
  end
end