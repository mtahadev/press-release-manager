class Organization < ApplicationRecord
  has_many :publishers
  has_many :press_releases, through: :publishers

  validates :name, presence: true, uniqueness: true
end
