class PlansController < ApplicationController
  def index
    @plans = Plan.includes(:user)
  end

  def new
    @plan = Plan.new
  end

  def create
    @plan = Plan.new(plan_params)
    if @plan.save
      redirect_to root_path
    else
      @plans = Plan.includes(:user)
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @plan = Plan.find(params[:id])
  end

  def edit
    @plan = Plan.find(params[:id])
  end

  def update
    @plan = Plan.find(params[:id])
    if @plan.update(plan_params)
      redirect_to plan_path(@plan)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @plan = Plan.find(params[:id])
    if @plan.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private

  def plan_params
    params.require(:plan).permit(:image, :title, :detail, :goal, :start_time).merge(user_id: current_user.id)
  end
end
