require 'rails_helper'

RSpec.describe Organization, type: :model do
  # Associations
  describe 'associations' do
    it { is_expected.to have_many(:publishers) }
    it { is_expected.to have_many(:press_releases).through(:publishers) }
  end

  # Validations
  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name) }
  end

  # Callbacks
  describe 'callbacks' do
    context 'when deleting an organization with associated publishers' do
      let!(:organization) { create(:organization) }
      before do
        create(:publisher, organization: organization)
      end

      it 'does not allow the organization to be deleted' do
        expect { organization.destroy }.not_to change(Organization, :count)
        expect(organization.errors[:base]).to include("Cannot delete organization with associated publishers.")
      end
    end
  end
end
