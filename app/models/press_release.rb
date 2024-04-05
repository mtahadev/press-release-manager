class PressRelease < ApplicationRecord
  belongs_to :publisher
  has_one :organization, through: :publisher
  belongs_to :author, class_name: "User", foreign_key: "user_id"

  enum status: { draft: 0, published: 1, archived: 2 }

  validates :title, presence: true
  validates :content, presence: true
  validates :publisher_id, presence: true
  validates :user_id, presence: true
  validate :future_publish_date

  private
  def future_publish_date
    if publish_date.present? && publish_date < Date.today
      errors.add(:publish_date, "can't be in the past")
    end
  end
end