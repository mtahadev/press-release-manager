require 'rails_helper'

RSpec.describe PressRelease, type: :model do
  # Validations
  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:content) }
    it { is_expected.to validate_presence_of(:publisher_id) }
    it { is_expected.to validate_presence_of(:user_id) }

    context 'publish_date in the future' do
      let(:user) { create(:user) }
      let(:publisher) { create(:publisher) }
      
      it 'is valid when publish_date is in the future' do
        press_release = build(:press_release, author: user, publisher: publisher, publish_date: 5.hours.from_now)
        expect(press_release).to be_valid
      end

      it 'is not valid when publish_date is in the past' do
        press_release = build(:press_release, publish_date: 1.hour.ago)
        press_release.valid?
        expect(press_release.errors[:publish_date]).to include("can't be in the past")
      end

      it 'is not valid when publish_date is less than 5 hours from now' do
        press_release = build(:press_release, publish_date: 4.hours.from_now)
        press_release.valid?
        expect(press_release.errors[:publish_date]).to include("should be at least 5 hours ahead of the current time.")
      end
    end
  end

  # Associations
  describe 'associations' do
    it { is_expected.to belong_to(:publisher) }
    it { is_expected.to belong_to(:author).class_name('User') }
    it { is_expected.to have_one(:organization).through(:publisher) }
  end

  # Callbacks
  describe 'callbacks' do
    it 'schedules PublishPressReleaseJob after creation' do
      allow(PublishPressReleaseJob).to receive(:set).and_return(PublishPressReleaseJob)
      press_release = create(:press_release)
      allow(PublishPressReleaseJob).to receive(:perform_later)
    end
  end
end
