class ParentEmailJob < ActiveJob::Base
  queue_as :default

  def perform
    # parent = Parent.first
    # ParentMiler.weekly_email(parent.email.deliver_now)
  end
end
