class PressRelease < ApplicationRecord
  require 'active_support/core_ext/numeric/time'

  enum status: { draft: 0, published: 1, archived: 2 }

  validates :title, presence: true
  validates :content, presence: true
  validates :publisher_id, presence: true
  validates :user_id, presence: true
  validate :validate_publish_date_in_future

  belongs_to :publisher
  has_one :organization, through: :publisher
  belongs_to :author, class_name: "User", foreign_key: "user_id"

  after_create :schedule_publish_press_release_job

  private
  
  def validate_publish_date_in_future
    if publish_date.blank?
      errors.add(:publish_date, "can't be blank")
    elsif publish_date < Time.now
      errors.add(:publish_date, "can't be in the past")
    elsif publish_date < Time.now + 4.9.hours
      errors.add(:publish_date, "should be at least 5 hours ahead of the current time.")
    end
  end

  def schedule_publish_press_release_job
    PublishPressReleaseJob.set(wait_until: publish_date).perform_later(id)
  end
end