class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to plan_path(@comment.plan)
    else
      @plan = @comment.plan
      @comments = @plan.comments
      render "plans/show"
    end
  end
  
  private
  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, plan_id: params[:plan_id])
  end
end
