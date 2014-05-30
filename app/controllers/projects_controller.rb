class ProjectsController < ApplicationController
  def create
    temp = Project.create(project_params)
    if temp.invalid?
      flash[:error] = "Invalid Project"
      redirect_to new_project_path(:hack_day_id => temp.hack_day_id)
      return
    end

    redirect_to temp.hack_day
  end

  def new
    @new_project = Project.new(:hack_day_id => params[:hack_day_id])
  end

  def update
    session[:remaining_votes] ||= {}
    session[:remaining_votes][params[:id]] ||= HackDay::MAX_VOTES

    if session[:remaining_votes][params[:id]] <= 0
      flash[:error] = "You are out of votes"
      redirect_to hack_day_path(params[:id])
      return
    end

    if params[:vote].blank?
      flash[:error] = "Select an option"
      redirect_to hack_day_path(params[:id])
      return
    end

    Project.increment_counter(:num_votes, params[:vote])
    session[:remaining_votes][params[:id]] -= 1
    flash[:notice] = "Vote Successfull"
    redirect_to hack_day_path(params[:id])
  end

  def project_params
    params.require(:project).permit(:description, :hack_day_id)
  end
end
