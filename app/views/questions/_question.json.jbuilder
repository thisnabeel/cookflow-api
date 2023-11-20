json.extract! question, :id, :questionable_type, :questionable_id, :body, :answer, :created_at, :updated_at
json.url question_url(question, format: :json)
