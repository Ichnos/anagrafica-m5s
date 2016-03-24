json.array!(@appointments) do |appointment|
  json.extract! appointment, :id, :title, :created_at, :updated_at
  json.url appointment_url(appointment, format: :json)
end
