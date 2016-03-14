json.array!(@activists) do |activist|
  json.extract! activist, :id, :username, :name, :surname, :email, :birth_city, :birth_date, :whatsApp, :facebook, :skype, :google_plus, :twitter, :mov_five_star, :meet_up
  json.url activist_url(activist, format: :json)
end
