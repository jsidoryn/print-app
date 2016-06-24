class SpecificationsController < ApplicationController

  before_action :find_job, only: [:index, :new, :create]
  # before_action :check_for_quotes, only: [:destroy]

  def index
    @specifications = @job.specifications.includes(:quotes)
  end

  def new
    @specification = Specification.new
  end

  def create
    @specification = @job.specifications.new(specification_params)
    if @specification.save
      flash[:notice] = "You have successfully added a new spec."
      redirect_to job_specifications_path(@job)
    else
      render :new
    end
  end

  def edit
    @specification = Specification.find(params[:id])
    @job = @specification.job
  end

  def update
    @specification = Specification.find(params[:id])
    if @specification.update(specification_params)
      flash[:notice] = "You have successfully edited a spec."
      redirect_to job_specifications_path(@specification.job)
    else
      render :edit
    end

  end

  def destroy
    @specification = Specification.find(params[:id])
    @job = @specification.job
    if @specification.has_quotes?
      redirect_to job_specifications_path(@specification.job),
      notice: "You can't delete the specification until you remove all quotes"
      return
    end

    @specification.destroy
    flash[:notice] = "You have successfully deleted a spec."
    redirect_to job_specifications_path(@job)
  end

  private

    def find_job
      @job = Job.find(params[:job_id])
    end

    def specification_params
      params.require(:specification).permit(:title, :description, :proof_required,
      :press_check_required, :notes, :job_due, :quote_due)
    end

#     def check_for_quotes
#       @specification = Specification.find(params[:id])
#       if @specification.quotes.empty?
#         true
#       else
#         false
#         redirect_to job_specifications_path(@specification.job),
#         notice: "You cant delete the specification until you remove all quotes"
#       end
#     end
end
