require 'rails_helper'

RSpec.describe Status, type: :model do
  before(:each) do
    @event_dates = FactoryGirl.create(:EventRef, max_registrants: 1)
    @p1 = FactoryGirl.create(:Registrant1)
  end

  describe 'validation' do
    it 'is a valid model' do
      expect(@p1.status).to be_valid
    end
  end

  describe 'email' do
    it 'sends registration email' do
      expect(RegistrationMailer).to respond_to(:success_registration_email)
    end

    it 'sends waitlisted email' do
      @p2 = FactoryGirl.create(:Registrant2)
      expect(@p2.status).to respond_to(:decide_email)
      expect(RegistrationMailer).to respond_to(:waitlist_registration_email)
    end

    it 'sends cancellation email' do
      @p1.destroy
      expect(@p1.status).to respond_to(:send_cancellation_email)
      expect(RegistrationMailer).to respond_to(:cancel_registration_email)
    end
  end
end
