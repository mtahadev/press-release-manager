class OrganizationsController < ApplicationController
  before_action :set_organization, only: %i[ show edit update destroy ]

  def index
    @organizations = Organization.all
  end

  def show
  end

  def new
    @organization = Organization.new
  end

  def edit
  end

  def create
    @organization = Organization.new(organization_params)
    if @organization.save
      redirect_to organization_url(@organization), notice: "Organization was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @organization.update(organization_params)
      redirect_to organization_url(@organization), notice: "Organization was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @organization.destroy
      redirect_to organizations_url, notice: 'Organization was successfully destroyed.'
    else
      render :show, status: :unprocessable_entity, location: @organization
      # redirect_to @organization, alert: @organization.errors.full_messages.to_sentence
    end
  end

  private
    def set_organization
      @organization = Organization.find(params[:id])
    end

    def organization_params
      params.require(:organization).permit(:name, :description)
    end
end
