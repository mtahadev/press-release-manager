class Organization < ApplicationRecord
  has_many :publishers
  has_many :press_releases, through: :publishers

  validates :name, presence: true, uniqueness: true

  before_destroy :check_for_publishers

  private
  def check_for_publishers
    if publishers.any?
      errors.add(:base, "Cannot delete organization with associated publishers.")
      throw(:abort)
    end
  end

end
