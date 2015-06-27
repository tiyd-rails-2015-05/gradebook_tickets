json.extract! @assignment, :id, :teacher_id, :name, :due
json.students @assignment.students do |student|
  json.student student.name
  json.student_id student.id
  json.grade student.get_grade(@assignment.id)
end
