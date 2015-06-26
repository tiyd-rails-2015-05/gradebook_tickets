json.extract! @teacher, :id, :name, :email
json.students @teacher.students do |student|
  json.extract! student, :id, :name, :email
  json.teacher student.teacher.name
  json.grades student.grades do |grade|
    json.assignment grade.assignment.name
    json.assignment_id grade.assignment.id
    json.score grade.score
  end
end
