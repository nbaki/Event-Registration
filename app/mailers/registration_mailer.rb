class RegistrationMailer < ActionMailer::Base
  default from: 'Event Committee <do-not-reply@upenn.edu>'
  include ActionView::Helpers::UrlHelper

  def success_registration_email(user, event_date)
    @user = user
    @event_date = event_date
    mail(to: @user.email, subject: "Apple Picking Event Submission")
  end

  def waitlist_registration_email(user, event_date)
    @user = user
    @event_date = event_date
    mail(to: @user.email, subject: "Your Waitlist Confirmation")
  end

  def cancel_registration_email(user)
    @user = user
    mail(to: @user.email, subject: "Apple Picking Cancellation")
  end

  def waitlist_to_registered_email(user, event_date)
    @user = user
    @event_date = event_date
    app_name = Rails.application.class.name.split('::').first.underscore.dasherize
    
    if Rails.env.production?
      @cancel_path = "https://www.myproductionsite.com/#{app_name}#{cancel_registrant_path(@user.uuid)}"
    else
      @cancel_path = "https://#{ENV["HOSTNAME"]}/#{ENV['USER']}/#{app_name}#{cancel_registrant_path(@user.uuid)}"
    end
    mail(to: @user.email, subject: "Waitlist Registration Update")
  end

end
