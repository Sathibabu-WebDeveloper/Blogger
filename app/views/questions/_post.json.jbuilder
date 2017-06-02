json.extract! question, :id, :name, :featured, :created_at, :updated_at
json.url question_url(question, format: :json)
