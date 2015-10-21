json.array!(@chores) do |chore|
  json.extract! chore, :id, :name, :date, :estimated_time
  json.url chore_url(chore, format: :json)
end
