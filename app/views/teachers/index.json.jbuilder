json.array!(@teachers) do |teacher|
  json.extract! teacher, :id, :name, :email
  json.url teacher_url(teacher, format: :json)
  json.students teacher.students do |student|
    json.extract! student, :id, :name, :email
    json.teacher student.teacher.name
    json.grades student.grades do |grade|
      json.assignment grade.assignment.name
      json.assignment_id grade.assignment.id
      json.score grade.score
    end
  end
end
