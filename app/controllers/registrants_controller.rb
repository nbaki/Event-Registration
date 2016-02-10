# Controller handles registrant access
class RegistrantsController < ApplicationController
  include RegistrantsHelper

  before_action :load_lookups

  def index
  end

  def new
    @registrant = Registrant.new
  end

  def create
    @registrant = Registrant.new(registrant_params.merge(year: @event_dates.year, uuid: SecureRandom.urlsafe_base64))

    if @registrant.save
      # Successfully Saved
      flash.now[:success] = 'Your registration form has been successfully submitted.'
      render action: :registration_message
    else
      flash.now[:error] = 'There was a problem submitting your form.'
      render action: :new
    end
  end

  def registration_message
  end

  def cancel_registration
    @registrant = Registrant.find_by_uuid(params[:id])
    unless @registrant.destroy
      flash.now[:error] = 'There was a problem cancelling your registration. Support has been notified'
    end
  end

  private

  def registrant_params
    params.require(:registrant).permit(
      :first_name, :last_name, :year, :dob, :email
    )
  end
end
