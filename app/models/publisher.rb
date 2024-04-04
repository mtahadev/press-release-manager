class Publisher < ApplicationRecord
  belongs_to :organization
  has_many :press_releases
end
