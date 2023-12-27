class PlansController < ApplicationController
  def index
  end

  def new
    @plan = Plan.new
  end

  def create
    @plan = Plan.new(plan_params)
    if @plan.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def plan_params
    params.require(:plan).permit(:image, :title, :detail, :goal, :start_time).merge(user_id: current_user.id)
  end
end
