class PlansController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_plan, only: [:show, :edit, :update, :destroy]
  before_action :check_author, only: [:edit, :update, :destroy]

  def index
    @plans = Plan.includes(:user)
    @today_schedule = Plan.today_schedule
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
    @comment = Comment.new
    @comments = @plan.comments.includes(:user)
  end

  def edit
  end

  def update
    if @plan.update(plan_params)
      redirect_to plan_path(@plan)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
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

  def set_plan
    @plan = Plan.find(params[:id])
  end

  def check_author
    unless current_user == @plan.user
      redirect_to root_path
    end
  end
end
