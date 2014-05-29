class ProjectsController < ApplicationController
  def update
  	if session["remaining_vote#{params[:id]}"] > 0
      if !params[:vote].blank?
        Project.increment_counter(:num_votes, params[:vote])
        session["remaining_vote#{params[:id]}"] -= 1
        flash[:notice] = "Vote Successfull"
      else
        flash[:error] = "Select an option"
      end
    else
      flash[:error] = "You are out of votes"
    end
    redirect_to hack_day_path(params[:id])
  end
end
