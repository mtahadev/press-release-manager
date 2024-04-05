require 'rails_helper'

RSpec.describe User, type: :model do
  # Association with PressRelease
  describe 'associations' do
    it { is_expected.to have_many(:press_releases).with_foreign_key('user_id') }
  end

  # Devise and Rolify methods (example)
  describe 'Devise methods' do
    let(:user) { create(:user) }

    it 'is database authenticatable' do
      expect(user.valid_password?('password')).to be true
    end
  end

  # Custom methods
  describe '#has_role?' do
    let(:user) { create(:user) }

    before do
      user.add_role :admin
    end

    it 'returns true if the user has the specified role' do
      expect(user.has_role?(:admin)).to be true
    end

    it 'returns false if the user does not have the specified role' do
      expect(user.has_role?(:user)).to be false
    end
  end
end
