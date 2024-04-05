# frozen_string_literal: true

class PressReleaseComponent < ViewComponent::Base
  def initialize(press_release:)
    @press_release = press_release
    @title = press_release.title
    @content = press_release.content
    @status = press_release.status
  end
end