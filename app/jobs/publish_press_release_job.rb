class PublishPressReleaseJob < ApplicationJob
  queue_as :default

  def perform(press_release_id)
    press_release = PressRelease.find_by(id: press_release_id)
    if press_release && press_release.status != "published"
      press_release.update(status: "published")
      # Additional actions like sending notifications can be added here
    end
  end
end