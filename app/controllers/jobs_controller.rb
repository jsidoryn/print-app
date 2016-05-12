class JobsController < ApplicationController
  def index
    @jobs = Job.all
  end

  def show
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      flash[:notice] = "You have successfully added a new job."
      redirect_to jobs_path
    else
      render :new
    end
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    flash[:notice] = "You have successfully deleted the job"
    redirect_to jobs_path
  end

  private

    def job_params
      params.require(:job).permit(:title, :job_number, :description)
    end

end
