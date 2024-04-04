class Publisher < ApplicationRecord
  belongs_to :organization
  has_many :press_releases

  validates :name, presence: true, uniqueness: { scope: :organization_id }
  validates :organization_id, presence: true

  validates :title, presence: true
  validates :content, presence: true
  validates :publisher_id, presence: true
  validates :user_id, presence: true
  validate :publish_date_cannot_be_in_the_past

  def publish_date_cannot_be_in_the_past
    if publish_date.present? && publish_date < Date.today
      errors.add(:publish_date, "can't be in the past")
    end
  end
end
