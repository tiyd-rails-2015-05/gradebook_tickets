class Parent < User
  belongs_to :student

  def self.send_email
    parents = Parent.all
    parents.each do |p|
      ParentMailer.weekly_email(p.email).deliver_now
    end
  end

end
