class PlansController < ApplicationController
  def index
  end

  def new
  end

  def create
  end

  private

  def plan_params
    params.require(:plan).permit(:image, :title, :detail, :goal, :start_time).merge(user_id: current_user.id)
  end
end
