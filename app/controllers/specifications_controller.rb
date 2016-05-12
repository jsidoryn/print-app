class SpecificationsController < ApplicationController

  before_filter :find_job, only: [:index, :new, :create]

  def index
    @specifications = @job.specifications
  end

  def new
    @specification = Specification.new
  end

  def create
    @specification = @job.specifications.new(specification_params)
    if @specification.save
      redirect_to job_specifications_path(@job)
    else
      render :new
    end
  end

  def destroy
    @specification = Specification.find(params[:id])
    @job = @specification.job
    @specification.destroy
    redirect_to job_specifications_path(@job)
  end

  private

    def find_job
      @job = Job.find(params[:job_id])
    end

    def specification_params
      params.require(:specification).permit(:title, :description)
    end

end
