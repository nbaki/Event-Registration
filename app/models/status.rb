# Status Model
class Status < ActiveRecord::Base
  self.table_name = :status
  belongs_to :registrant

  validates :status, inclusion: { in: %w(Registered Waitlisted) }, presence: true

  after_save :decide_email
  after_destroy :send_cancellation_email

  def decide_email
    event_start = EventRef.find_by_year(self.registrant.year).event_start
    if self.status == 'Registered'
      if self.created_at == self.updated_at
        RegistrationMailer.success_registration_email(self.registrant, event_start).deliver_now
      elsif self.created_at < self.updated_at
        actual_status = Status.find(self.registrant_id)
        if actual_status.status == 'Registered'
          RegistrationMailer.waitlist_to_registered_email(self.registrant, event_start).deliver_now
        end
      end
    elsif self.status == 'Waitlisted'
      RegistrationMailer.waitlist_registration_email(self.registrant, event_start).deliver_now
    end
  end

  def send_cancellation_email
    RegistrationMailer.cancel_registration_email(self.registrant).deliver_now
  end
end
