class DashboardController < ApplicationController
  before_action :teacher_logged_in?, only: [:teacher]
  before_action :student_logged_in?, only: [:student]
  before_action :parent_logged_in?, only: [:parent]
  

  def index
    if current_user.type == "Teacher"
      redirect_to controller: 'dashboard', action: 'teacher'
    elsif current_user.type == "Student"
      redirect_to controller: 'dashboard', action: 'student'
    elsif current_user.type == "Parent"
      redirect_to controller: 'dashboard', action: 'parent'
    else
      redirect_to new_user_session_path
    end
  end

  def student
    @student = Student.find_by_id(current_user.id)
    @grades = Grade.where(student_id: current_user.id).all
  end

  def parent
    @parent = Parent.find_by_id(current_user.id)
    @grades = Grade.where(student_id: @parent.student_id).all
  end

  def teacher
    @teacher = Teacher.find_by_id(current_user.id)
  end

end
