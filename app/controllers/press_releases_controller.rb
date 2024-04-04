class PressReleasesController < ApplicationController
  before_action :set_press_release, only: %i[ show edit update destroy ]

  # GET /press_releases or /press_releases.json
  def index
    @press_releases = PressRelease.all
  end

  # GET /press_releases/1 or /press_releases/1.json
  def show
  end

  # GET /press_releases/new
  def new
    @press_release = PressRelease.new
  end

  # GET /press_releases/1/edit
  def edit
  end

  # POST /press_releases or /press_releases.json
  def create
    @press_release = PressRelease.new(press_release_params)

    respond_to do |format|
      if @press_release.save
        format.html { redirect_to press_release_url(@press_release), notice: "Press release was successfully created." }
        format.json { render :show, status: :created, location: @press_release }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @press_release.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /press_releases/1 or /press_releases/1.json
  def update
    respond_to do |format|
      if @press_release.update(press_release_params)
        format.html { redirect_to press_release_url(@press_release), notice: "Press release was successfully updated." }
        format.json { render :show, status: :ok, location: @press_release }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @press_release.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /press_releases/1 or /press_releases/1.json
  def destroy
    @press_release.destroy!

    respond_to do |format|
      format.html { redirect_to press_releases_url, notice: "Press release was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_press_release
      @press_release = PressRelease.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def press_release_params
      params.require(:press_release).permit(:title, :content, :publish_date, :status, :user_id, :publisher_id)
    end
end