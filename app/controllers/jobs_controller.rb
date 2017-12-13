class JobsController < ApplicationController
  # before_action :set_job, only: [:show, :destroy, :edit, :update]

  def index
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
    # binding.pry
    if @job.save
      flash[:success] = "You created #{@job.title} at #{@company.name}"
      redirect_to company_jobs_path(@company)
    else
      flash[:failure] = "Failure"
      render :new
    end
  end

  def show
    @job = Job.find(params[:id])

    # @job = Job.find(params[:id])
  end

  def edit
    @job = Job.find(params[:id])
    @company = Company.find(params[:company_id])
  end

  def update
    @job = Job.find(params[:id])
    @job.update(job_params)
    flash[:success] = "Job #{@job.title} Updated!"
    redirect_to company_job_path(@job.company, @job)
  end

  def destroy
    @job = Job.find(params[:id])

    @company = @job.company
    @job.destroy

    flash[:success] = "#{@job.title} @ #{@company.name} was deleted!"

    redirect_to company_jobs_path(@company)
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city, :category_id)
  end

  # def set_job
  #   @job = Job.find(params[:id])
  # end
end
