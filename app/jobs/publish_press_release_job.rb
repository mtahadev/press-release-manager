class PublishPressReleaseJob < ApplicationJob
  queue_as :default

  retry_on StandardError, wait: 5.minutes, attempts: 3

  def perform(press_release_id)
    press_release = PressRelease.find_by(id: press_release_id)
    if press_release
      press_release.update(status: "published")
      # Additional actions like sending notifications can be added here
    else
      raise "PressRelease with id #{press_release_id} not found"
    end
  rescue => e
    # Log the error for investigation
    Rails.logger.error "Error occurred while publishing PressRelease #{press_release_id}: #{e.message}"
    # You can choose to re-raise the error to make the job retryable or handle it gracefully
    # raise e
  end
end
