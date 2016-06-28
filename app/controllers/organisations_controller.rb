class OrganisationsController < ApplicationController
  before_action :get_organisation, only: [:show, :set_current_organisation]

  def index
    @organisations = Organisation.all
  end

  def new
    @organisation = Organisation.new
  end

  def create
    @organisation = Organisation.new(organisation_params)
    if @organisation.save
      redirect_to organisations_path
    else
      render :new
    end
  end

  def show

  end

  def set_current_organisation
    session[:organisation_id] = @organisation.id
    redirect_to organisations_path
  end

  def logout
    session[:organisation_id] = nil
    redirect_to organisations_path
  end

  private

  def organisation_params
    params.require(:organisation).permit(:title, :phone, :organisation_type)
  end

  def get_organisation
    @organisation = Organisation.find(params[:id])
  end
end
