class HackDaysController < ApplicationController
  def new
    @projects = [""]
  end

  def show
    if (@hack_day = HackDay.find_by_id(params[:id]))
      session["remaining_vote#{params[:id]}"] ||= 3
      @votes_left = session["remaining_vote#{params[:id]}"]
    else
      redirect_to "/404.html"
    end
  end

  def create
    @title = params[:title]
    @new_hack_day = HackDay.new(title: @title)
    @projects = params[:projects]
    @projects.select!(&:present?)
    if(@projects.length >= 2)
      unless @new_hack_day.save
        flash.now[:error] = "Enter a title"
        render "new" and return
      end
      @projects.each do |x|
        @new_hack_day.projects.create(value: x.strip)
      end
      flash[:notice] = "Vote Creation Successfull"
      redirect_to @new_hack_day
    else
      flash.now[:error] = "Make sure to have two or more options"
      render "new"
    end
  end
end
