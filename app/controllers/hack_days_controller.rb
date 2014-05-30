class HackDaysController < ApplicationController
  def new
    @new_hack_day = HackDay.new
  end

  def show
    @hack_day = HackDay.find_by_id(params[:id])

    if @hack_day.nil?
      render :file => "#{Rails.root}/public/404", :layout => false, :status => :not_found
      return
    end

    session[:remaining_votes] ||= {}
    session[:remaining_votes][params[:id]] ||= HackDay::MAX_VOTES
    @votes_left = session[:remaining_votes][params[:id]]
  end

  def create
    @new_hack_day = HackDay.create(hack_params)
    if @new_hack_day.invalid?
      render new_hack_day_path
      return
    end

    redirect_to @new_hack_day
  end

  def hack_params
    params.require(:hack_day).permit(:title)
  end
end
