require 'rails_helper'

RSpec.describe Publisher, type: :model do
  # Associations
  describe 'associations' do
    it { is_expected.to belong_to(:organization) }
    it { is_expected.to have_many(:press_releases).dependent(:destroy) }
  end

  # Validations
  describe 'validations' do
    subject { create(:publisher) } # Creates an instance of publisher before running the uniqueness validation
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:organization_id) }
    it { is_expected.to validate_uniqueness_of(:name).scoped_to(:organization_id) }
  end
end
