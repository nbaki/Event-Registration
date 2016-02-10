# RegistrantsHelper Module
module RegistrantsHelper
  def load_lookups
    @event_dates = EventRef.order(year: :desc).first
  end
end
