# Registrant Model
class Registrant < ActiveRecord::Base

  has_one :status, dependent: :destroy

  validates_presence_of :year, :first_name, :last_name, :dob, :email, :uuid
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates_uniqueness_of :email

  before_save :decide_status

  def decide_status
    num_total = EventStats.find_by_year(self.year).num_total

    if num_total >= EventRef.find_by_year(self.year).max_registrants
      self.build_status(status: 'Waitlisted')
    else
      self.build_status(status: 'Registered')
    end
  end

  def full_name
    "#{first_name} #{last_name}".titleize
  end
end
