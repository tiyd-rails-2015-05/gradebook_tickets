class Parent < ActiveRecord::Base
  belongs_to :student
  has_secure_password

  def self.send_email
    parents = Parent.all
    parents.each do |p|
      ParentMailer.weekly_email(p.email).deliver_now
    end
  end
end
