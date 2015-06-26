json.array!(@achievements) do |achievement|
  json.extract! achievement, :id, :student_id, :name, :amount
  json.url achievement_url(achievement, format: :json)
end
