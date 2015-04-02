json.array!(@parties) do |party|
  json.extract! party, :id, :title, :started_at, :ended_at, :city, :state, :zip_code, :phone, :email, :url
  json.url party_url(party, format: :json)
end
