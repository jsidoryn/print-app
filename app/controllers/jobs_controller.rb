class JobsController < ApplicationController
  def index
    @jobs = Job.all
  end

  def show
    find_job
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    @job.printer_quotes_open!
    if @job.save
      flash[:notice] = "You have successfully added a new job."
      redirect_to jobs_path
    else
      render :new
    end
  end

  def edit
    find_job
  end

  def update
    find_job
    if @job.update(job_params)
      flash[:notice] = "You have successfully edited a job."
      redirect_to jobs_path
    else
      render :end
    end
  end

  def destroy
    find_job
    @job.destroy
    flash[:notice] = "You have successfully deleted the job"
    redirect_to jobs_path
  end

  def close_printer_quotes
    find_job
    @job.printer_quotes_closed!
    redirect_to job_specifications_path(@job)
  end

  private

    def find_job
      @job = Job.find(params[:id])
    end

    def job_params
      params.require(:job).permit(:title, :job_number, :description)
    end

end
