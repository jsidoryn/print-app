class QuotesController < ApplicationController
  def index
    @specification = Specification.find(params[:specification_id])
    @quotes = @specification.quotes
    @job = @specification.job
  end

  def new
    @specification = Specification.find(params[:specification_id])
    @quote = @specification.quotes.new
  end

  def create
    @specification = Specification.find(params[:specification_id])
    @quote = @specification.quotes.new(quote_params)
    @job = @specification.job
    if @quote.save
      redirect_to job_specifications_path(@job)
    else
      render :new
    end
  end

  def destroy
    @quote = Quote.find(params[:id])
    @job = @quote.specification.job
    @quote.destroy
    redirect_to job_specifications_path(@job)
  end

  private

    def quote_params
      params.require(:quote).permit(:line_item_1, :cost_1, :line_item_2, :cost_2,
      :line_item_3, :cost_3, :notes, :printer_name)
    end

end
