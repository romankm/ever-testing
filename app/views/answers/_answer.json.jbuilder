json.extract! answer, :id, :user_id, :task_id, :link, :attached_file, :created_at, :updated_at
json.url answer_url(answer, format: :json)
