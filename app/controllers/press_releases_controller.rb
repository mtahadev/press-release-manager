class PressReleasesController < ApplicationController
  before_action :set_press_release, only: %i[ show edit update destroy ]

  def index
    # Assuming `status` is a parameter that comes from the UI for filtering
    @press_releases = if params[:status].present?
                        PressRelease.where(status: params[:status])
                      else
                        PressRelease.all
                      end
  
    # Respond to Turbo Stream to allow dynamic updates
    respond_to do |format|
      format.html # For initial page load
      format.turbo_stream # For dynamic updates without page reload
    end
  end

  def show
  end

  def new
    @press_release = PressRelease.new
  end

  def edit
  end

  def create
    @press_release = PressRelease.new(press_release_params)
    if @press_release.save
      redirect_to press_release_url(@press_release), notice: "Press release was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @press_release.update(press_release_params)
      redirect_to press_release_url(@press_release), notice: "Press release was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end
  
  def destroy
    @press_release.destroy!
    redirect_to press_releases_url, notice: "Press release was successfully destroyed."
  end

  private
  def set_press_release
    @press_release = PressRelease.find(params[:id])
  end

  def press_release_params
    params.require(:press_release).permit(:title, :content, :publish_date, :status, :user_id, :publisher_id)
  end
end
