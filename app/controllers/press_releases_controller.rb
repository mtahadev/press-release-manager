class PressReleasesController < ApplicationController
  before_action :set_press_release, only: %i[ show edit update destroy ]

  # GET /press_releases or /press_releases.json
  def index
    # @press_releases = PressRelease.all
    @press_releases = {
      published: PressRelease.where(status: :published),
      draft: PressRelease.where(status: :draft),
      archived: PressRelease.where(status: :archived)
    }
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

  # def create
  #   @press_release = PressRelease.new(press_release_params)
  #   if @press_release.save
  #     # Schedule the job if publish_date is in the future
  #     if @press_release.publish_date > Time.current
  #       PublishPressReleaseJob.set(wait_until: @press_release.publish_date).perform_later(@press_release.id)
  #     end
  #     redirect_to @press_release, notice: 'Press release was successfully created and scheduled for publishing.'
  #   else
  #     render :new, status: :unprocessable_entity
  #   end
  # end

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
