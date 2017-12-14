class CommentsController < ApplicationController
  def create
    @job = Job.find(params[:job_id])
    @job.comments.create(comment_params)

    redirect_to company_job_path(@job.company, @job)
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :author)
  end
end
