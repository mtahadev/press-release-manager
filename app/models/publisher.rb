class Publisher < ApplicationRecord
  belongs_to :organization
  has_many :press_releases, dependent: :destroy

  validates :name, presence: true, uniqueness: { scope: :organization_id }
  validates :organization_id, presence: true
end
