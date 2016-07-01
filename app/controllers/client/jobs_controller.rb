class Client::JobsController < ApplicationController

  before_action :authorise_client

  def index
    @jobs = current_organisation.jobs
  end
end
