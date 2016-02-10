require 'rails_helper'

RSpec.describe EventRef, type: :model do
  it 'has at least one valid factory' do
    expect(FactoryGirl.create(:EventRef)).to be_valid
  end

  it 'validates an invalid factory' do
    expect(FactoryGirl.build(:EventRef, year: nil)).not_to be_valid
    expect(FactoryGirl.build(:EventRef, event_start: nil)).not_to be_valid
    expect(FactoryGirl.build(:EventRef, max_registrants: nil)).not_to be_valid
  end
end
