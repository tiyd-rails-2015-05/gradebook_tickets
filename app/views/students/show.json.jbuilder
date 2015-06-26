json.extract! @student, :id, :name, :email
json.teacher @student.teacher.name
json.grades @student.grades do |grade|
  json.assignment grade.assignment.name
  json.assignment_id grade.assignment.id
  json.score grade.score
end
