class JobsController < ApplicationController
  before_action :set_job, only: [:show, :destroy, :edit, :update]

  def index
    # if params[:company_id]
    binding.pry
      @company = Company.find(params[:company_id])
      @jobs = @company.jobs
  end

  def new
    @company = Company.find(params[:company_id])
    @job = Job.new()
    @categories = Category.all
  end

  def create
    @company = Company.find(params[:company_id])
    @job = @company.jobs.new(job_params)
    if @job.save
      flash[:success] = "You created #{@job.title} at #{@company.name}"
      redirect_to company_jobs_path(@company)
    else
      flash[:failure] = "Failure"
      render :new
    end
  end

  def show
    @comment = @job.comments.new
    @comments = @job.comments.map do |comment|
      comment if comment.id != nil
    end.compact.reverse
  end

  def edit
    @company = Company.find(params[:company_id])
  end

  def update
    @job.update(job_params)
    flash[:success] = "Job #{@job.title} Updated!"
    redirect_to company_job_path(@job.company, @job)
  end

  def destroy
    @company = @job.company
    @job.destroy

    flash[:success] = "#{@job.title} @ #{@company.name} was deleted!"

    redirect_to company_jobs_path(@company)
  end

  def sort
    @jobs = Job.where(city: params[:sort])
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city, :category_id)
  end

  def set_job
    @job = Job.find(params[:id])
  end
end
