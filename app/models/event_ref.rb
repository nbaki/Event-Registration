# Event Dates Model
class EventRef < ActiveRecord::Base
  self.table_name = :event_ref
  validates_presence_of :year, :event_start, :max_registrants
end
