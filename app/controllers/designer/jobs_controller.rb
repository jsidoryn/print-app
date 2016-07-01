class Designer::JobsController < ApplicationController

  before_action :authorise_designer
  before_action :find_job, only: [:edit, :update, :destroy, :close_printer_quotes]

  def index
    @jobs = current_organisation.jobs
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    # why does this work when not in permitted params
    #@client_organisation = Organisation.find(params[:job][:organisations])
    # @job.organisations << [current_organisation]
    @job.printer_quotes_open!
    if @job.save
      flash[:notice] = "You have successfully added a new job."
      redirect_to designer_jobs_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @job.update(job_params)
      flash[:notice] = "You have successfully edited a job."
      redirect_to designer_jobs_path
    else
      render :end
    end
  end

  def destroy
    @job.destroy
    flash[:notice] = "You have successfully deleted the job"
    redirect_to designer_jobs_path
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
      params.require(:job).permit(:title, :job_number, :description, job_organisation_ids: [])
    end
end
