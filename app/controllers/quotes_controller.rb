class QuotesController < ApplicationController
  def index
    @specification = Specification.find(params[:specification_id])
    @quotes = @specification.quotes
    @job = @specification.job
  end
end
