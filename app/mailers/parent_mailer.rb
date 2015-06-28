class ParentMailer < ApplicationMailer
  def weekly_email(email)
    @parent = Parent.find_by_email(email)
    @student = Student.find_by_id(@parent.student_id)
    @grades = @student.grades
    mail(to: email, subject: "Your child's weekly progress!")
  end

  def test_mail
    mail(to: 'dadkisso@gmail.com', subject: 'test email')
  end
end
