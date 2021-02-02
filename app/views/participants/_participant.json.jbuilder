json.extract! participant, :id, :first_name, :last_name, :email, :status, :created_at, :updated_at
json.url participant_url(participant, format: :json)
