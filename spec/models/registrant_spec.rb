require 'rails_helper'

RSpec.describe Registrant, type: :model do
  describe 'validation' do
    it 'has at least one valid factory' do
      expect(FactoryGirl.build(:Registrant1)).to be_valid
    end

    it 'validates an invalid factory' do
      expect(FactoryGirl.build(:Registrant1, first_name: nil)).not_to be_valid
      expect(FactoryGirl.build(:Registrant1, last_name: nil)).not_to be_valid
      expect(FactoryGirl.build(:Registrant1, email: nil)).not_to be_valid
      expect(FactoryGirl.build(:Registrant1, dob: nil)).not_to be_valid
      expect(FactoryGirl.build(:Registrant1, uuid: nil)).not_to be_valid
    end
  end

  describe 'deciding status' do
    before(:each) do
      @p1 = FactoryGirl.build(:Registrant1)
      @p2 = FactoryGirl.build(:Registrant2)
    end

    it 'picks register status' do
      FactoryGirl.create(:EventRef)
      @p1.save
      expect(@p1.status.status).to eq('Registered')
    end

    it 'picks waitlist status' do
      FactoryGirl.create(:EventRef, max_registrants: 1)
      @p1.save
      @p2.save
      expect(@p2.status.status).to eq('Waitlisted')
    end
  end
end
